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
    'weather_data_to_digital_twins',
    default_args=default_args,
    description='Get weather data every minute and post to digital twins API',
    schedule_interval=timedelta(minutes=60),  # 60분마다 실행
    catchup=False
)

# GET 요청 함수
def get_weather(measure_position_id, **kwargs):
    # 현재 시간을 가져오기
    now = datetime.now(seoul_tz)
    # 현재 시간을 60분 단위로 반올림
    minutes_to_next_interval = 60 - (now.minute % 60)
    current_time = (now + timedelta(minutes=minutes_to_next_interval)).replace(second=0, microsecond=0)
    
    # 시작 시간을 현재 시간에서 60분 전으로 설정
    start_time = current_time - timedelta(minutes=60)

    url = "http://220.124.222.91:28080/api/data/weather?"
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

do_ids = [
   "KR-109941-0001",
   "KR-109941-0002",
   "KR-109941-0003",
   "KR-109941-0004",
   "KR-109941-0005",
   "KR-109941-0006",
   "KR-109941-0007",
   "KR-109941-0008",
   "KR-109941-0009",
   "KR-109941-0010",
   "KR-109941-0011",
   "KR-109941-0012",
   "KR-109941-0013",
   "KR-109941-0014",
   "KR-109941-0015",
   "KR-109941-0016",
   "KR-109941-0017",
   "KR-109941-0018",
   "KR-109941-0019",
   "KR-109941-0020",
   "KR-109941-0021",
   "KR-109941-0022",
   "KR-109941-0023",
   "KR-109941-0024",
   "KR-109941-0025",
   "KR-109941-0026",
   "KR-109941-0027",
   "KR-109941-0028",
   "KR-109941-0029",
   "KR-109941-0030",
   "KR-109941-0031",
   "KR-109941-0032",
   "KR-109941-0033",
   "KR-109941-0034",
   "KR-109941-0035",
   "KR-109941-0036",
   "KR-109941-0037",
   "KR-109941-0038",
   "KR-109941-0039",
   "KR-109941-0040",
   "KR-109941-0041",
   "KR-109941-0042",
   "KR-109941-0043"
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
    dt_id = "KR-02-K10000-20240001"

    for device_id in range(1, len(do_ids) + 1):
        try:
            weather_data = get_weather(device_id + 141)  # 142부터 시작하도록 맞춤
            do_id = do_ids[device_id - 1]
            post_to_digital_twins(weather_data, dt_id, do_id)
        except Exception as e:
            print(f"Error retrieving data: {e}")
            


# PythonOperator를 사용하여 GET 및 POST 작업 정의
process_device_task = PythonOperator(
    task_id='process_device_data',
    python_callable=process_device_data,
    provide_context=True,
    dag=dag,
)

