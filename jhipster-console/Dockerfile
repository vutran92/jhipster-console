FROM docker.elastic.co/kibana/kibana:6.0.1

ENV ELASTICSEARCH_URL=http://jhipster-elasticsearch:9200

COPY kibana.yml /usr/share/kibana/config/kibana.yml
RUN ./bin/kibana-plugin install https://github.com/sivasamyk/logtrail/releases/download/v0.1.23/logtrail-6.0.1-0.1.23.zip
COPY logtrail.json /usr/share/kibana/plugins/logtrail/logtrail.json