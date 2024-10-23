from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
import requests
import pytz
seoul_tz = pytz.timezone('Asia/Seoul')
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
    'parkingLot_data_to_digital_twins',
    default_args=default_args,
    description='Get parkingLot data every minute and post to digital twins API',
    schedule_interval=timedelta(minutes=10),  # 10분마다 실행
    catchup=False
)

# GET 요청 함수
def get_parkingLot(parking_lot_id, **kwargs):
    # 현재 시간을 가져오기
    now = datetime.now(seoul_tz)
    minutes_to_next_interval = 10 - (now.minute % 10)
    current_time = (now + timedelta(minutes=minutes_to_next_interval)).replace(second=0, microsecond=0)
    
    # 시작 시간을 현재 시간에서 10분 전으로 설정
    start_time = current_time - timedelta(minutes=10)

    url = "http://220.124.222.91:38080/api/data/parking?"
    params = {
        "start_date_time": start_time.strftime("%Y-%m-%d %H:%M:%S"),
        "end_date_time": current_time.strftime("%Y-%m-%d %H:%M:%S"),
        "parking_lot_id": str(parking_lot_id),
    }
    
    response = requests.get(url, params=params)
    
    # 에러 체크
    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(f"GET request failed with status code {response.status_code}")

do_ids = [
   "KR-109012-0001",
   "KR-109012-0002",
   "KR-109012-0003",
   "KR-109012-0004",
   "KR-109012-0005",
   "KR-109012-0006",
   "KR-109012-0007",
   "KR-109012-0008",
   "KR-109012-0009",
   "KR-109012-0010",
   "KR-109012-0011",
   "KR-109012-0012"
]

device_ids = [
   11111111,
   11251813,
   16488201,
   16489518,
   17039715,
   17385794,
   17435963,
   17680713,
   17759313,
   20019319
]

# POST 요청 함수
def post_to_digital_twins(data, dt_id, do_id, **kwargs):
    post_url = f"http://localhost:1219/fedit/v1/digital-twins/{dt_id}/digital-objects/{do_id}/data"
    headers = {
        'Content-Type': 'application/json',
    }
    wrapped_data = {"data": data}
    response = requests.post(post_url, json=wrapped_data, headers=headers)
    if response.status_code not in [200, 201]:
        raise Exception(f"POST request failed with status code {response.status_code}")

# 각 do_id에 대해 GET 및 POST 요청 수행 함수
def process_device_data(**kwargs):
    dt_id = "KR-02-N10000-20240001"
    for i, device_id in enumerate(device_ids):
        try:
            # device_id를 사용하여 주차장 데이터를 가져오기
            parkingLot_data = get_parkingLot(device_id)
            
            # 배열 인덱스를 맞춰 do_id 선택 (리스트의 인덱스는 0부터 시작)
            do_id = do_ids[i] 
            
            # 데이터 전송
            post_to_digital_twins(parkingLot_data, dt_id, do_id)
        except Exception as e:
            print(f"Error retrieving data for device_id {device_id}: {e}")
            
# PythonOperator를 사용하여 GET 및 POST 작업 정의
process_device_task = PythonOperator(
    task_id='process_device_data',
    python_callable=process_device_data,
    provide_context=True,
    dag=dag,
)

