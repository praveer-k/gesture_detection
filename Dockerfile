FROM gcr.io/getindata-images-public/mlflow:1.22.0

WORKDIR /mlflow

ENV TINI_VERSION v0.19.0

EXPOSE 4180

# ENV DEFAULT_ARTIFACT_ROOT="gs://mlflow_cloud_storage_artifacts"
# ENV DB_USER="mlflow-user"
# ENV DB_PASS="system"
# ENV DB_NAME="mlflow"
# ENV OAUTH_PROXY_CONFIG="./secrets/oauth-proxy-secret-key.json"

# COPY secrets secrets

RUN apt-get update && \
    apt-get install -y curl netcat && \
    mkdir -p /oauth2-proxy && \
    cd /oauth2-proxy && \
    curl -L -o proxy.tar.gz https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v6.1.1/oauth2-proxy-v6.1.1.linux-amd64.tar.gz && \
    tar -xzf proxy.tar.gz && \
    mv oauth2-proxy-*.linux-amd64/oauth2-proxy . && \
    rm proxy.tar.gz && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh start.sh
RUN chmod +x start.sh

CMD ./start.sh