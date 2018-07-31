#!/bin/bash

set -euo pipefail

es_url=http://elasticsearch:9200
# Wait for Elasticsearch to start up before doing anything.


while [[ "$(curl -u "elastic:${ELASTIC_PASSWORD}" -s -o /dev/null -w '%{http_code}' $es_url)" != "200" ]]; do
    sleep 5
done

# Set the password for the kibana user.
# REF: https://www.elastic.co/guide/en/x-pack/6.0/setting-up-authentication.html#set-built-in-user-passwords
until curl -u "elastic:${ELASTIC_PASSWORD}" -s -H 'Content-Type:application/json' \
     -XPUT $es_url/_xpack/security/user/kibana/_password \
     -d "{\"password\": \"${ELASTIC_PASSWORD}\"}"
do
    sleep 2
    echo Retrying...
done
