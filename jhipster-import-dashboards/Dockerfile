FROM docker.elastic.co/beats/metricbeat:5.3.0

COPY dashboards /usr/share/jhipster-dashboards

ENV ELASTICSEARCH_URL=jhipster-elasticsearch
ENV ELASTICSEARCH_PORT=9200
ENV INITIAL_SLEEP_MILLISECONDS=15000

CMD sleep $INITIAL_SLEEP_MILLISECONDS && /usr/share/metricbeat/scripts/import_dashboards -es "http://${ELASTICSEARCH_URL}:${ELASTICSEARCH_PORT}" -dir /usr/share/jhipster-dashboards/