FROM docker.elastic.co/kibana/kibana-oss:6.1.0

ENV ELASTICSEARCH_URL=http://jhipster-elasticsearch:9200

COPY kibana.yml /usr/share/kibana/config/kibana.yml
RUN ./bin/kibana-plugin install https://github.com/sivasamyk/logtrail/releases/download/v0.1.23/logtrail-6.1.0-0.1.23.zip
COPY logtrail.json /usr/share/kibana/plugins/logtrail/logtrail.json