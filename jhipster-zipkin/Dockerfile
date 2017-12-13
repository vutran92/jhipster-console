FROM quay.io/openzipkin/zipkin:2.4.1

# Embed zipkin dependencies, a spark job to compute the graph between microservices
ENV ZIPKIN_REPO=https://search.maven.org/remote_content?g=io.zipkin.dependencies&a=zipkin-dependencies \
    ZIPKIN_DEPENDENCIES_VERSION=1.11.0 \
    STORAGE_TYPE=elasticsearch

RUN wget -O zipkin-dependencies.jar $ZIPKIN_REPO&v=$ZIPKIN_DEPENDENCIES_VERSION.jar

# Copy CRON files
COPY periodic/ /etc/periodic/
# To run the dependency job once, run: ./run-job.sh from inside the container
# `docker-compose exec jhipster-zipkin ./run-job.sh`
COPY run-job.sh .

CMD crond -b && java ${JAVA_OPTS} -cp . org.springframework.boot.loader.JarLauncher
