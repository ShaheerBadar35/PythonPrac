from ultralytics import YOLO
from PIL import Image
import cv2
import time

# # Create a new YOLO model from scratch
# model = YOLO("yolov8n.yaml")

# Load a pretrained YOLO model (recommended for training)
# model = YOLO("yolov8n.pt")
model = YOLO("yolov8m.pt")
im1 = Image.open("City1.jpg")
vid1 = cv2.VideoCapture("theif.mp4")
# Train the model using the 'coco8.yaml' dataset for 3 epochs
# results = model.train(data="coco8.yaml", epochs=3)

# Evaluate the model's performance on the validation set
# results = model.val()

# Perform object detection on an image using the model
# results = model("https://ultralytics.com/images/bus.jpg")

# Export the model to ONNX format
# success = model.export(format="onnx")

#accepts all formats - image/dir/PATH/URL/video/PIL/ndarray. -0 for webcam
# results = model.predict(source=im1,show = True, conf = 0.5)
# time.sleep(20)
results = model.predict(source="theif.mp4",save = True, conf = 0.5)