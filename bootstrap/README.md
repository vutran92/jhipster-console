# JHipster Console Bootstrap

Run the following commands to set up the JHipster Console using the `jhipster/jhipster-console` image from the Docker Hub:
```
mkdir conf
curl -o conf/logstash.conf https://raw.githubusercontent.com/jhipster/jhipster-console/v1.1.0/log-monitoring/log-config/logstash.conf
curl -o docker-compose.yml https://raw.githubusercontent.com/jhipster/jhipster-console/v1.1.0/bootstrap/docker-compose.yml
docker-compose up -d
```
