#!/bin/bash

set -euo pipefail

beat=$1

until curl -s -k http://kibana:5601; do
    echo "Waiting for kibana..."
    sleep 5
done
sleep 5

chmod go-w /usr/share/$beat/$beat.yml


echo "Setting up dashboards..."
# Load the sample dashboards for the Beat.
# REF: https://www.elastic.co/guide/en/beats/metricbeat/master/metricbeat-sample-dashboards.html
${beat} --strict.perms=false setup -v
