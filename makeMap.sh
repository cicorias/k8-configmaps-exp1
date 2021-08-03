#!/usr/bin/env bash

kubectl create configmap my-config --from-file=config.txt --from-literal=extra-param=extra-value --from-literal=another-param=another-value


kubectl apply -f deployment.yaml
$ kubectl port-forward kuard-config 8080