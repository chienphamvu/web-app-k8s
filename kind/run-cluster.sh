#!/bin/bash

set -xe

# kind v0.9.0
kind delete cluster || true
kind create cluster --config ./kind-config.yaml

# linkerd version edge-21.2.2
linkerd check --pre
linkerd install | kubectl apply -f -
linkerd check
linkerd viz install | kubectl apply -f -

#kubectl v1.19.4
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=180s

kubectl apply -f ../k8s
