# https://docs.ultralytics.com/modes/predict/#inference-sources for more information

from ultralytics import YOLO

model = YOLO('{PATH TO TRAINED MODEL SUCH AS best.pt or last.pt}')

# Predict the model
model.predict('{PATH TO IMAGE}', save=True)
