FROM kibana:4.4.1

COPY entrypoint.sh /tmp/entrypoint.sh
COPY kibana.yml /opt/kibana/config/kibana.yml
COPY jhipster-monitor.svg /tmp/jhipster-monitor.svg

COPY dashboards /tmp/dashboards/
COPY load.sh /tmp/load.sh

RUN chmod +x /tmp/entrypoint.sh
RUN chmod +x /tmp/load.sh

RUN kibana plugin --install elastic/timelion

CMD ["/tmp/entrypoint.sh"]
