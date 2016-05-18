# JHipster Console Bootstrap

Run the following commands to set up the JHipster Console using the `jhipster/jhipster-console` image from the Docker Hub:
If you want to use a fixed version instead of the latest, replace `master` by a version number like `v1.2.1`

```
mkdir conf
curl -o conf/logstash.conf https://raw.githubusercontent.com/jhipster/jhipster-console/master/log-monitoring/log-config/logstash.conf
curl -o docker-compose.yml https://raw.githubusercontent.com/jhipster/jhipster-console/master/bootstrap/docker-compose.yml
docker-compose up -d
```
