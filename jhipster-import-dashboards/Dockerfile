FROM docker.elastic.co/beats/metricbeat:5.5.1

COPY dashboards/ /tmp
WORKDIR /usr/share/metricbeat/scripts/
COPY wait-for-it.sh .
ENV ELASTICSEARCH_URL=http://jhipster-elasticsearch:9200

# Wait 5 min for elasticsearch because it can be really slow to start
CMD ./wait-for-it.sh -t 300 "$ELASTICSEARCH_URL/_cluster/health?wait_for_status=yellow" -- ./import_dashboards -es $ELASTICSEARCH_URL -dir /tmp/