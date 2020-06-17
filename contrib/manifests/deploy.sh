#!/usr/bin/env bash

METHOD="$1"

if [[ -z "$1" ]]; then
  echo "Info: \$1 was empty, using kubectl create (set to apply for kubectl apply)"
  METHOD="create"
fi

APP_NAME=hello-world PARTNER_URL=http://hello-world-2 envsubst < deployment.yaml | kubectl "$METHOD" -f -
APP_NAME=hello-world PARTNER_URL=http://hello-world-2 envsubst < service.yaml | kubectl "$METHOD" -f -
APP_NAME=hello-world-2 PARTNER_URL=http://hello-world envsubst < deployment.yaml | kubectl "$METHOD" -f -
APP_NAME=hello-world-2 PARTNER_URL=http://hello-world envsubst < service.yaml | kubectl "$METHOD" -f -
