#!/bin/bash

# Install Prometheus 
# Check https://istio.io/docs/setup/getting-started/

set -euxo pipefail

DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$DIR"/env.sh

NS="monitoring"

kubectl create namespace "$NS"
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install prometheus-operator stable/prometheus-operator --namespace "$NS"

kubectl get all --all -n "$NS"

