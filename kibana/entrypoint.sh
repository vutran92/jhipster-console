#!/usr/bin/env bash

cp /tmp/jhipster-monitor.svg /opt/kibana/optimize/bundles/src/ui/public/images/kibana.svg

# Wait for the Elasticsearch container to be ready before starting Kibana.
echo "Waiting for Elasticsearch to startup"
while true; do
    curl elk-elasticsearch:9200 2>/dev/null && break
done

echo "Loading dashboards"
cd /tmp
./load.sh

echo "Starting Kibana"
exec kibana

