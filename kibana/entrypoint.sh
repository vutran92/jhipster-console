#!/bin/bash

cp /tmp/jhipster-console.svg /opt/kibana/optimize/bundles/src/ui/public/images/kibana.svg

# Wait for the Elasticsearch container to be ready before starting Kibana.
echo "Waiting for Elasticsearch to startup"
while true; do
    curl elk-elasticsearch:9200 2>/dev/null && break
    sleep 1
done

echo "Loading dashboards"
cd /tmp
./load.sh

[ ! -f /tmp/.initialized ] && echo "Configuring default settings" && curl -XPUT http://elk-elasticsearch:9200/.kibana/config/4.4.1 -d '{"dashboard:defaultDarkTheme": true, "defaultIndex": "logstash-*"}' && touch /tmp/.initialized

if [ "$ENABLE_ALERTING" = "true" ]
then
/opt/start-elastalert.sh
fi

echo "Starting Kibana"
exec kibana
