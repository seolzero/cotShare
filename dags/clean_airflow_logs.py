from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
import os
import time

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 10, 2),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

LOG_DIRS = ["/home/jejutp/airflow/logs", "/home/jejutp/kafka_2.11-2.4.0/logs"]
RETENTION_DAYS = 30

def clean_old_logs():
    now = time.time()
    for log_dir in LOG_DIRS:
        for root, dirs, files in os.walk(log_dir):
            for f in files:
                file_path = os.path.join(root, f)
                if os.stat(file_path).st_mtime < now - timedelta(days=RETENTION_DAYS).total_seconds():
                    os.remove(file_path)
                    print(f"Deleted: {file_path}")


with DAG('clean_airflow_logs', default_args=default_args, schedule_interval='@daily') as dag:
    clean_logs = PythonOperator(
        task_id='clean_old_logs',
        python_callable=clean_old_logs
    )

