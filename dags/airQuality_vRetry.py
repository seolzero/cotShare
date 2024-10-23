from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
import requests
import pytz
import time
from typing import List, Dict, Any

seoul_tz = pytz.timezone('Asia/Seoul')
time_interval = 60

# 기본 설정
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 10, 4),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# DAG 정의
dag = DAG(
    'airQuality_data_to_digital_twins_vRetry',
    default_args=default_args,
    description='Get airquality data every minute and post to digital twins API',
    schedule_interval=timedelta(minutes=60),  # 60분마다 실행
    catchup=False
)

# 중첩 JSON에서 "value" 키의 값이 배열인 경우를 찾는 함수
def find_value_arrays(data: Any, key_to_find="value") -> List[Any]:
    """
    중첩된 JSON에서 지정된 키의 값이 배열인 경우를 모두 찾아 리스트로 반환
    
    Args:
        data (Any): 탐색할 JSON 데이터 (dict, list, 기본형 모두 가능)
        key_to_find (str): 찾고자 하는 키의 이름 (기본값: "value")

    Returns:
        List[Any]: 배열 타입의 "value" 값들을 리스트로 반환
    """
    found_arrays = []

    if isinstance(data, dict):
        for key, value in data.items():
            if key == key_to_find and isinstance(value, list):
                # key가 "value"이고 값이 배열인 경우 리스트에 추가
                found_arrays.append(value)
            else:
                # 재귀적으로 탐색
                found_arrays.extend(find_value_arrays(value, key_to_find))

    elif isinstance(data, list):
        for item in data:
            found_arrays.extend(find_value_arrays(item, key_to_find))

    return found_arrays

# GET 요청 함수
def get_airquality(measure_position_id, start_time, current_time, **kwargs):
    url = "http://220.124.222.91:28080/api/data/airQuality?"
    params = {
        "start_date_time": start_time.strftime("%Y-%m-%d %H:%M:%S"),
        "end_date_time": current_time.strftime("%Y-%m-%d %H:%M:%S"),
        "measure_position_id": str(measure_position_id),
    }
    response = requests.get(url, params=params)
    
    # 에러 체크
    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(f"GET request failed with status code {response.status_code}")

# POST 요청 함수
def post_to_digital_twins(data, dt_id, do_id, start_time, **kwargs):
    post_url = f"http://localhost:1219/fedit/v1/digital-twins/{dt_id}/digital-objects/{do_id}/data"
    headers = {
        'Content-Type': 'application/json',
    }
    wrapped_data = {"data": data}
    response = requests.post(post_url, json=wrapped_data, headers=headers)
    if response.status_code not in [200, 201]:
        raise Exception(f"POST request failed with status code {response.status_code}")

do_ids = ["KR-109941-0044",
"KR-109941-0045",
"KR-109941-0046",
"KR-109941-0047",
"KR-109941-0048",
"KR-109941-0049",
"KR-109941-0050",
"KR-109941-0051",
"KR-109941-0052",
"KR-109941-0053",
"KR-109941-0054",
"KR-109941-0055"]

def process_device_data(**kwargs):
    dt_id = "KR-02-K10000-20240001"
    start_date_time = datetime.now(seoul_tz)
    now = datetime.now(seoul_tz)

    # 현재 시간을 60분 단위로 반올림
    minutes_to_next_interval = 60 - (now.minute % 60)
    current_time = (now + timedelta(minutes=minutes_to_next_interval)).replace(second=0, microsecond=0)
    # 시작 시간을 현재 시간에서 60분 전으로 설정
    start_time = current_time - timedelta(minutes=60)
    
    # 전체 디바이스에 대해 3번 재시도
    attempts = 3

    while attempts > 0:
        try:
            all_devices_success = True  # 모든 디바이스가 성공했는지 확인하기 위한 플래그

            for device_id in range(1, 13):
                try:
                    # GET 요청 실행
                    airquality_data = get_airquality(device_id, start_time, current_time)

                    # "value" 키의 값이 배열인 경우 찾기
                    value_arrays = find_value_arrays(airquality_data, "value")

                    # 배열 중 하나라도 비어있지 않은 경우 탐색 종료
                    has_non_empty_array = any(isinstance(array, list) and array for array in value_arrays)

                    if not has_non_empty_array:
                        # 모든 배열이 비어있으면 재시도 처리
                        print(f"Device {device_id}: No valid data, retrying.{attempts}")
                        all_devices_success = False  # 하나라도 실패하면 플래그를 False로 설정
                        continue  # 다음 디바이스로 이동

                    # 유효한 데이터가 있을 경우 POST 요청 수행
                    post_to_digital_twins(airquality_data, dt_id, do_ids[device_id - 1], start_date_time)

                except Exception as e:
                    print(f"Error retrieving data for device {device_id}: {e}")
                    all_devices_success = False

            if all_devices_success:
                # 모든 디바이스가 성공적으로 처리되었으면 루프 종료
                break
            else:
                # 성공하지 못한 경우, 재시도 대기 시간 설정
                print(f"Attempt {4 - attempts}: Some devices failed, retrying in {1} seconds.")
                time.sleep(5)
                attempts -= 1

        except Exception as e:
            print(f"Error during processing: {e}")
            attempts -= 1

    # 시도 횟수를 모두 사용한 후에도 데이터가 없는 경우
    if attempts == 0:
        print("Max retry attempts reached. Some devices may have failed.")
        for device_id in range(1, 13):
            try:
                previous_time = start_time - timedelta(minutes=60)
                airquality_data = get_airquality(device_id, previous_time, start_time)
                now = datetime.now(seoul_tz).strftime('%Y-%m-%d %H:%M:00')
                airquality_data['airQualityMeasurement']['observedAt'] = now
                # 이전 데이터로 POST 요청
                post_to_digital_twins(airquality_data, dt_id, do_ids[device_id - 1], start_date_time)
            except Exception as e:
                print(f"Error retrieving data for device {device_id}: {e}")


# PythonOperator를 사용하여 GET 및 POST 작업 정의
process_device_task = PythonOperator(
    task_id='process_device_data',
    python_callable=process_device_data,
    provide_context=True,
    dag=dag,
)

