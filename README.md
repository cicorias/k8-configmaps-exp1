


❯ kubectl create configmap my-config \
    --from-file=game.properties \
    --from-file=application.yml=app.yaml
error: from-env-file cannot be combined with from-file or from-literal