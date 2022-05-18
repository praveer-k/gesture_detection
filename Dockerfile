FROM gcr.io/getindata-images-public/mlflow:latest

ENV BACKEND_STORE_URI=""
ENV DEFAULT_ARTIFACT_ROOT=""

CMD mlflow ui --port 8080 --host 0.0.0.0