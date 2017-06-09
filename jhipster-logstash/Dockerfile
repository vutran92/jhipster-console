FROM docker.elastic.co/logstash/logstash:5.4.0

COPY logstash.yml /usr/share/logstash/config/
COPY logstash.conf /usr/share/logstash/pipeline/

ENV ELASTICSEARCH_HOST=jhipster-elasticsearch \
    ELASTICSEARCH_PORT=9200 \
    INPUT_UDP_PORT=5000

#CMD logstash -f /usr/share/logstash/pipeline/logstash.conf
