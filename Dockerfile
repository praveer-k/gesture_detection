FROM python:3.9-slim-buster

RUN pip install mlflow

CMD mlflow ui --host 0.0.0.0 --port 8080 --backend-store-uri=postgresql://mlflow-user:system@35.198.128.157/mlflow --default-artifact-root=gs://mlflow_cloud_storage_artifacts