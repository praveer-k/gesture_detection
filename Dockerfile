FROM python:3.9-slim-buster

RUN pip install mlflow

CMD mlflow ui --host 0.0.0.0 --port 8080 --backend-store-uri=${BACKEND_STORE_URI} --default-artifact-root=${DEFAULT_ARTIFACT_ROOT}