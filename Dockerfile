FROM python:3.9-slim

COPY requirements.txt requirements.txt

RUN apt-get update && \
    apt-get install postgresql postgresql-contrib -y && \
    python3 -m pip install -r requirements.txt --no-cache-dir

CMD mlflow ui --host 0.0.0.0 --port 8080 --backend-store-uri=${BACKEND_STORE_URI} --default-artifact-root=${DEFAULT_ARTIFACT_ROOT}