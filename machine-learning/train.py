from ultralytics import YOLO

# ベースとするモデル
model = YOLO('yolov8n.pt')

# M1 macのGPUを使ってモデルを学習
results = model.train(
    data='datasets/book-seg.v3i.yolov8-obb/data.yaml', 
    epochs=3, 
    imgsz=640, 
    device='cpu'
)
