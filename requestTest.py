import requests
import json

url='http://10.252.73.36:1209/mirrorlake/v1/digital-twins/KR-02-K10000-20240001/sensors/S_yolo_detect/data'

payload = json.dumps({
	'data': {
		'test': 'postSSUL'
		}
})
headers = {
 'Content-Type':'application/json'
}

response = requests.request('POST', url, headers=headers, data=payload)

print(response.text)

#curl --location 'http://10.252.73.36:1209/mirrorlake/v1/digital-twins/KR-02-K10000-20240001/sensors/S_yolo_detect/data?count=5'
