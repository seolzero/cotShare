from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.models import Variable  # Airflow Variable 가져오기
from datetime import datetime, timedelta
import requests
import pytz

# 시간대 설정
seoul_tz = pytz.timezone('Asia/Seoul')

# DAG 처음 실행될 때만 'Initialized_time' 설정
if not Variable.get("Initialized_time", default_var=None):
    Initialized_time = datetime.now(seoul_tz).strftime("%Y-%m-%d %H:%M:%S")
    Variable.set("Initialized_time", Initialized_time)
else:
    Initialized_time = Variable.get("Initialized_time")

# device_id별로 last_measurement_dates 초기화
device_ids = [1, 2, 3]
for device_id in device_ids:
    if not Variable.get(f"last_measurement_date_{device_id}", default_var=None):
        Variable.set(f"last_measurement_date_{device_id}", Initialized_time)

print("Initialized last_measurement_dates with current time for all device_ids:", Initialized_time)

# 기본 설정
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 9, 24),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(seconds=1),
}

# DAG 정의
dag = DAG(
    'river_to_digital_twins',
    default_args=default_args,
    description='Get river water level data every minute and post to digital twins API',
    schedule_interval=timedelta(minutes=1),  # 1분마다 실행
    catchup=False
)

# GET 요청 함수
def get_river_water_level(device_id, **kwargs):
    current_time = (datetime.now(seoul_tz)).replace(second=0, microsecond=0)
    start_time = current_time - timedelta(minutes=1)

    url = "http://dev.jinwoosi.co.kr:8083/v1/river-water-level"
    params = {
        "start_date_time": start_time.strftime("%Y-%m-%d %H:%M:%S"),
        "end_date_time": current_time.strftime("%Y-%m-%d %H:%M:%S"),
        "device_id": str(device_id),
        "page_number": "1",
        "number_of_rows": "10",
        "lang": "ko"
    }
    print(params)
    response = requests.get(url, params=params)
    
    # 에러 체크
    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(f"GET request failed with status code {response.status_code}")

# POST 요청 함수
def post_to_digital_twins(data, dt_id, do_id, **kwargs):
    post_url = f"http://localhost:1219/fedit/v1/digital-twins/{dt_id}/digital-objects/{do_id}/data"
    headers = {
        'Content-Type': 'application/json',
    }

    wrapped_data = {"data": data}
    response = requests.post(post_url, json=wrapped_data, headers=headers)

    if response.status_code != 200:
        raise Exception(f"POST request failed with status code {response.status_code}")

# 각 device_id에 대해 GET 및 POST 요청 수행 함수
def process_device_data(**kwargs):
    # device_id에 대응하는 dt_id와 do_id 배열 정의
    dt_id = "KR-02-K10000-20240001"
    do_ids = ["KR-104710-0001", "KR-104710-0002", "KR-104710-0003"]
    device_ids = [1, 2, 3]
    
    for device_id in device_ids:
        try:
            # GET 요청
            water_level_data = get_river_water_level(device_id)
            
            # 'list'가 비어 있는지 확인하여 처리
            if not water_level_data.get('list') or len(water_level_data['list']) == 0:
                print(f"Device {device_id}: No data available, skipping.")
                continue

            # 받은 데이터에서 measurement_date 추출
            new_measurement_date = water_level_data['list'][0]['measurement_date']

            # 이전에 저장된 measurement_date를 Airflow Variable에서 가져옴
            last_measurement_date = Variable.get(f"last_measurement_date_{device_id}", default_var=Initialized_time)

            # 이전에 저장된 measurement_date와 비교
            if last_measurement_date == new_measurement_date:
                print(f"Device {device_id}: measurement_date is the same, skipping post.")
            else:
                # measurement_date가 다르면 POST 요청을 수행
                do_id = do_ids[device_ids.index(device_id)]
                post_to_digital_twins(water_level_data, dt_id, do_id)

                # 새로운 measurement_date를 Airflow Variable에 저장
                Variable.set(f"last_measurement_date_{device_id}", new_measurement_date)
                print(f"Device {device_id}: New data posted successfully. {new_measurement_date}")
        
        except Exception as e:
            print(f"Error retrieving data for device_id {device_id}: {e}")

# PythonOperator를 사용하여 GET 및 POST 작업 정의
process_device_task = PythonOperator(
    task_id='process_device_data',
    python_callable=process_device_data,
    provide_context=True,
    dag=dag,
)

