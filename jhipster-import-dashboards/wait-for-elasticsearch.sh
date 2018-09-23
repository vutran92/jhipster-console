#!/usr/bin/env bash

echo "Waiting for Elasticsearch to startup (max 5min)"
WAIT=0
while [ $WAIT -lt 300 ]; do
    curl ${ELASTICSEARCH_URL}/_cluster/health 2>/dev/null && echo "" && echo "Importing dashboards" && break
    sleep 1
    (( WAIT++ ))
done

# set logstash-* as the default index pattern
curl ${KIBANA_URL}/api/kibana/settings -H "Origin: ${KIBANA_URL}" -H 'kbn-version: 6.4.1' -H 'content-type: application/json' -H 'accept: application/json' -H "Referer: ${KIBANA_URL}/app/kibana" --data-binary '{"changes":{"defaultIndex":"logstash-*"}}'
