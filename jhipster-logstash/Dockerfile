FROM docker.elastic.co/logstash/logstash-oss:6.4.1

# RUN mkdir /usr/share/logstash/data
RUN chmod -R 777 /usr/share/logstash/data/
USER logstash

COPY logstash.yml /usr/share/logstash/config/
COPY logstash.conf /usr/share/logstash/pipeline/
COPY grok_pattern.txt /usr/share/logstash/pipeline/

ENV ELASTICSEARCH_HOST=jhipster-elasticsearch \
    ELASTICSEARCH_PORT=9200 \
    INPUT_TCP_PORT=5000 \
    INPUT_UDP_PORT=5000 \
    INPUT_HTTP_PORT=5001 \
    LOGSTASH_DEBUG=false

CMD logstash -f /usr/share/logstash/pipeline/logstash.conf
