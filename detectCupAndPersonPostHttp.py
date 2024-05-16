import datetime
import cv2
import requests
import json
from ultralytics import YOLO

CONFIDENCE_THRESHOLD = 0.6
GREEN = (0, 255, 0)
WHITE = (255, 255, 255)

coco128 = open('./cocoNames.txt', 'r')
data = coco128.read()
class_list = data.split('\n')
coco128.close()

model = YOLO('./yolov8n.pt')

cap = cv2.VideoCapture(0)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

mirrorlakeURL = 'http://10.252.73.36:1209/mirrorlake/v1/digital-twins/KR-02-K10000-20240001/sensors/S_yolo_detect/data'

while True:
   start = datetime.datetime.now()

   ret, frame = cap.read()
   if not ret:
      print('Cam Error')
      break

   detection = model(frame)[0]

   cup_detected = False
   person_detected = False

   for data in detection.boxes.data.tolist(): # data : [xmin, ymin, xmax, ymax, confidence_score, class_id]
      confidence = float(data[4])
      if confidence < CONFIDENCE_THRESHOLD:
         continue

      xmin, ymin, xmax, ymax = int(data[0]), int(data[1]), int(data[2]), int(data[3])
      label = int(data[5])
      cv2.rectangle(frame, (xmin, ymin), (xmax, ymax), GREEN, 2)
      cv2.putText(frame, class_list[label]+' '+str(round(confidence, 2)) + '%', (xmin, ymin), cv2.FONT_ITALIC, 1, WHITE, 2)

      if class_list[label] == 'cup':
         cup_detected = True
      elif class_list[label] == 'person':
         person_detected = True

   # cup & person detect HTTP POST
   if cup_detected:
      if person_detected:
         payload = json.dumps({
            'data': {
               'object': ['cup', 'person']
               }
         })
      else:
         payload = json.dumps({
            'data': {
               'object': ['cup']
               }
         })
      
      try:
         headers = {'Content-type': 'application/json', 'Accept':'text/json'}
         response = requests.request('POST', mirrorlakeURL, headers=headers, data=payload)
         print("POST request status code:", response.status_code)
      except Exception as e:
         print("Error occurred during HTTP POST request:", e)

   end = datetime.datetime.now()

   total = (end - start).total_seconds()
   print(f'Time to process 1 frame: {total * 1000:.0f} milliseconds')

   fps = f'FPS: {1 / total:.2f}'
   cv2.putText(frame, fps, (10, 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 2)

   cv2.imshow('frame', frame)

   if cv2.waitKey(1) == ord('q'):
      break

cap.release()
cv2.destroyAllWindows()
