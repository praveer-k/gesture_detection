FROM python:3.9-slim

COPY requirements.txt requirements.txt

RUN apt-get update && \
    apt-get install postgresql postgresql-contrib -y && \
    python3 -m pip install -r requirements.txt --no-cache-dir

CMD mlflow server --host ${HOST} --port ${PORT} --backend-store-uri=${BACKEND_STORE_URI} --default-artifact-root=${DEFAULT_ARTIFACT_ROOT}