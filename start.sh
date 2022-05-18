#!/usr/bin/env bash
set -e
export BACKEND_STORE_URI=postgresql://$DB_USER:$DB_PASS@/$DB_NAME?unix_socket=/cloudsql/opendatasets-349618:europe-west3:ml-flow-database 
mlflow ui --host 0.0.0.0 --port 8080 --backend-store-uri=${BACKEND_STORE_URI} --default-artifact-root=${DEFAULT_ARTIFACT_ROOT} &
while ! nc -z localhost 8080 ; do sleep 1 ; done
/oauth2-proxy/oauth2-proxy --upstream=http://0.0.0.0:8080 --config=${OAUTH_PROXY_CONFIG} --http-address=0.0.0.0:4180 &

wait -n