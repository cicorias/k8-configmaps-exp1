#!/usr/bin/env bash

kubectl create configmap my-config \
    --from-file=game.properties \
    --from-literal=azure.application-insights.instrumentation-key=$(yq e '.azure.application-insights.instrumentation-key' app.yml) \
    --from-file=application.yml=app.yml
    # --from-file=config.txt \
    # --from-file=application.properties \
    # --from-literal=extra-param=extra-value \
    # --from-literal=another-param=another-value


kubectl apply -f deployment.yaml

echo "=============================="
kubectl describe configmap my-config
echo "****************************"
sleep 5
kubectl describe pod kuard-config


read -n 1 -s -r -p "Press any key to port forward"
kubectl port-forward kuard-config 8080


read -n 1 -s -r -p "Press any key to delete"
kubectl delete pod kuard-config && kubectl delete configmap my-config




