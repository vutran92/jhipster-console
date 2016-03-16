# JHipster Console

This is the [JHipster](http://jhipster.github.io/) Console, based on the [ELK Stack](https://www.elastic.co/products). It provides a default configuration to get started with logs and metrics monitoring with ELK as well as some nice dashboards.

## Centralized logging and metrics monitoring with ELK

The ELK stack is composed of :
- [Elasticsearch][] for indexing the logs
- [Logstash][] to manage and process the logs
- [Kibana][] to visualize the logs with a nice interface

The JHipster Console is based on the official Elasticsearch, Logstash and Kibana docker images. We have made a few visual changes to Kibana and setup useful dashboards, so that you can get started to monitor your JHipster apps in minutes.

### Configure your applications

To configure a JHipster app to forward their logs to ELK, enable logstash logging in their application-dev.yml or application-prod.yml.

    jhipster:
        logging:
            logstash:
                enabled: true
                host: localhost
                port: 5000
                queueSize: 512

To configure metrics monitoring, enable metrics log reporting in your JHipster apps.

    jhipster:
    	metrics:
       	    logs:
           	enabled: true
            	reportFrequency: 60 # seconds

### Start or stop ELK with docker

To start ELK:

    docker-compose up -d

You can now access the JHipster Console at http://localhost:5601
It should automatically receive logs from your applications.

To stop ELK:

    docker-compose stop

Once stopped, you can remove the containers:

    docker-compose rm

### Logstash configuration

Logstash is configured to listen to syslog messages on UDP port 5000 and forward them to an Elasticsearch instance on it's default port 9200.
You can change this behaviour or add inputs and filters for other log formats in `logstash/logstash.conf`.

### Additional data added to the logs

In order to trace the origin of logs, those are enriched with:
- app name: (_spring.application.name_)
- host: (IP address of the server)
- port: (_server.port_)
- instance_name: app_name-host:port
- eureka instance ID: (_eureka.instance.instanceId_) (only for microservices and gateway)

### Add new dashboards and visualizations

Add your JSON files in `/kibana/dashboards/` and restart the jhipster-console container to have them automatically loaded in JHipster Console:

    docker-compose restart jhipster-console

### Save your searches, visualization as JSON for auto import

Searches, visualization and dashboards created in Kibana can be exported using the _Settings_ > _Objects_ menu.
You can extract the JSON description of a specific object under the `_source` field of the export.json file.
You can then put this data in a JSON file in one of the `kibana/dashboard` sub-folder for auto-import.

#### Save your new dashboards 

Because Kibana create visualizations IDs after loading them, you might run into issues while trying to save and reload dashboards that come from a different instance of JHipster console. To create new auto-loaded dashboards, first add your new visualizations in `kibana/dashboard/visualization`, then restart kibana and re-create your dashboards in JHipster-console. You can then save those dashboards to JSON files in `kibana/dashboard/dashboards`.

## Alerting with Elastalert

[Elastalert](https://github.com/Yelp/elastalert) is an alerting system that can generate alerts from data in Elasticsearch.

### Alerting config

Modify `alerts/config.yaml`, for example you can change the alerting frequency:

    run_every:
 	 minutes: 1

### Write alertings rules

Add new YAML rule files in `alerts/rules` and then test them over past data with:

    ./test-alerting-rule.sh rule.yaml

Note that those YAML files should have a `.yaml` file extension. Read more on how to write rules at [Elastalert's official documentation](https://elastalert.readthedocs.org/en/latest/ruletypes.html)


[JHipster]: https://jhipster.github.io/
[Elasticsearch]: https://www.elastic.co/products/elasticsearch
[Logstash]: https://www.elastic.co/products/logstash
[Kibana]: https://www.elastic.co/products/kibana
[Elastalert]: https://elastalert.readthedocs.org
