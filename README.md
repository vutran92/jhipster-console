# JHipster Monitor

This is the [JHipster](http://jhipster.github.io/) Monitor, based on the [ELK Stack](https://www.elastic.co/products). It provides a default configuration to get started with logs and metrics monitoring with ELK as well as some nice dashboards.

## Centralized logging and metrics monitoring with ELK

The ELK stack is composed of :
- [Elasticsearch][] for indexing the logs
- [Logstash][] to manage and process the logs
- [Kibana][] to visualize the logs with a nice interface

The JHipster monitor uses the official Elasticsearch, Logstash and Kibana images. We add only a few visual changes to Kibana and setup some dashboards for you.

### Configure your applications

To configure a JHipster app to forward their logs to ELK, enable logstash logging in their application-dev.yml or application-prod.yml.

    jhipster:
        logging:
            logstash:
                enabled: true
                host: localhost
                port: 5000
                queueSize: 512

This setup is recommended for a production environment where centralizing logs is very interesting.

To configure metrics monitoring, enable metrics log reporting in your JHipster apps.

    jhipster:
        logs:
            enabled: false
            reportFrequency: 60 # seconds

### Start or stop ELK with docker

To start ELK:

    docker-compose up -d

You can now access Kibana at http://localhost:5601
It should automatically receive logs from your applications.

To stop ELK:

    docker-compose stop

Once stopped, you can remove the containers:

    docker-compose rm

### Logstash configuration

Logstash is configured to listen to syslog messages on UDP port 5000 and forward them to an Elasticsearch instance on it's default port 9200. 
You can change this behaviour or add inputs and filters for other log formats in `logstash/logstash.conf`.

### Additional data added to the logs

In order to trace the origin of logs, before being forwarded to logstash, those are enriched with:
- the app name: (_spring.application.name_)
- their port: (_server.port_) (only for microservices and gateway)
- their eureka instance ID: (_eureka.instance.instanceId_) (only for microservices and gateway)

### Add new dashboards and visualizations

Add your JSON files in `/kibana/dashboards/` and rebuild the Kibana container to have them automatically loaded in JHipster Monitor:

    docker-compose build


### Install Kibana plugins

To install Kibana plugins, modify the `kibana/Dockerfile` and add the following line: 

    RUN kibana plugin --install elastic/timelion

Then rebuild the Kibana container:

    docker-compose build

[JHipster]: https://jhipster.github.io/
[Elasticsearch]: https://www.elastic.co/products/elasticsearch
[Logstash]: https://www.elastic.co/products/logstash
[Kibana]: https://www.elastic.co/products/kibana

