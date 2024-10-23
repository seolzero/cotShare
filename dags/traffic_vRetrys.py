from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
import requests
import pytz
import time
from typing import List, Dict, Any

seoul_tz = pytz.timezone('Asia/Seoul')
time_interval = 10

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
    'traffic_to_digital_twins_vRetry',
    default_args=default_args,
    description='Get traffic data every minute and post to digital twins API',
    schedule_interval=timedelta(minutes=10),  # 10분마다 실행
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
def get_traffic(latitude, longitude, start_time, current_time, **kwargs):
    url = "http://220.124.222.91:18080/api/data/traffic?radial_distance=5"
    params = {
        "start_date_time": start_time.strftime("%Y-%m-%d %H:%M:%S"),
        "end_date_time": current_time.strftime("%Y-%m-%d %H:%M:%S"),
        "latitude": latitude,
        "longitude": longitude
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

# Latitude and Longitude pairs
coordinates = [
    (33.4219399, 126.5505904),
    (33.313754, 126.5714914),
    (33.25022, 126.27838),
    (33.25099, 126.41689),
    (33.3402, 126.47921),
    (33.39223, 126.49457),
    (33.23834, 126.42586),
    (33.271523, 126.60766),
    (33.45307315, 126.7235079),
    (33.5548185, 126.7969015),
    (33.491318, 126.811386),
    (33.37372, 126.59245),
    (33.462147, 126.936424),
    (33.2334272, 126.313741),
    (33.244854, 126.5718),
    (33.514103, 126.52193),
    (33.500607, 126.65108),
    (33.2447173, 126.5598201),
    (33.469604, 126.4918),
    (33.452126, 126.407455)
]

do_ids = [
    "KR-104111-0001", "KR-104111-0002", "KR-104111-0003",
    "KR-104111-0004", "KR-104111-0005", "KR-104111-0006",
    "KR-104111-0007", "KR-104111-0008", "KR-104111-0009",
    "KR-104111-0010", "KR-104111-0011", "KR-104111-0012",
    "KR-104111-0013", "KR-104111-0014", "KR-104111-0015",
    "KR-104111-0016", "KR-104111-0017", "KR-104111-0018",
    "KR-104111-0019", "KR-104111-0020"
]

# 각 do_id에 대해 GET 및 POST 요청 수행 함수
def process_device_data(**kwargs):
    dt_id = "KR-02-C20000-20240001"
    start_date_time = datetime.now(seoul_tz)
    now = datetime.now(seoul_tz)
    # 현재 시간을 10분 단위로 반올림
    minutes_to_next_interval = 10 - (now.minute % 10)
    current_time = (now + timedelta(minutes=minutes_to_next_interval)).replace(second=0, microsecond=0)
    
    # 시작 시간을 현재 시간에서 10분 전으로 설정
    start_time = current_time - timedelta(minutes=10)
    # 전체 디바이스에 대해 3번 재시도
    attempts = 3

    while attempts > 0:
        try:
            all_devices_success = True  # 모든 디바이스가 성공했는지 확인하기 위한 플래그
            # Use zip to pair coordinates with do_ids
            for (latitude, longitude), do_id in zip(coordinates, do_ids):
               try:
                  # GET 요청 실행
                  traffic_data = get_traffic(latitude, longitude, start_time, current_time)
                  
                  # "value" 키의 값이 배열인 경우 찾기
                  value_arrays = find_value_arrays(traffic_data, "value")

                  # 배열 중 하나라도 비어있지 않은 경우 탐색 종료
                  has_non_empty_array = any(isinstance(array, list) and array for array in value_arrays)
                  
                  if not has_non_empty_array:
                     # 모든 배열이 비어있으면 재시도 처리
                     print(f"Device {do_id}: No valid data, retrying.{attempts}")
                     all_devices_success = False  # 하나라도 실패하면 플래그를 False로 설정
                     continue  # 다음 디바이스로 이동
                  
                  # 유효한 데이터가 있을 경우 POST 요청 수행
                  post_to_digital_twins(traffic_data, dt_id, do_id, start_date_time)
               
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
        for (latitude, longitude), do_id in zip(coordinates, do_ids):
            try:
                previous_time = start_time - timedelta(minutes=10)
                traffic_data = get_traffic(latitude, longitude, previous_time, start_time)
                now = datetime.now(seoul_tz).strftime('%Y-%m-%d %H:%M:00')
                traffic_data['trafficMeasurement']['observedAt'] = now
                # 이전 데이터로 POST 요청
                post_to_digital_twins(traffic_data, dt_id, do_id, start_date_time)
            except Exception as e:
                print(f"Error retrieving data for device {device_id}: {e}")

# PythonOperator를 사용하여 GET 및 POST 작업 정의
process_device_task = PythonOperator(
    task_id='process_device_data',
    python_callable=process_device_data,
    provide_context=True,
    dag=dag,
)

