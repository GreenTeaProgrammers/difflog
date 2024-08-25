from ultralytics import YOLO

# Export the model
model = YOLO("yolov8n.pt")
model.export(format="coreml")
