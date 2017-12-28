FROM openzipkin/zipkin:2.4.2

# Embed zipkin dependencies, a spark job to compute the graph between microservices
ENV ZIPKIN_REPO=https://repo1.maven.org/maven2/io/zipkin/dependencies/zipkin-dependencies \
    ZIPKIN_DEPENDENCIES_VERSION=1.11.1 \
    STORAGE_TYPE=elasticsearch

RUN apk update && \                                                                                                                               apk add ca-certificates wget openssl && \                                                               
    update-ca-certificates && \
    wget -O zipkin-dependencies.jar $ZIPKIN_REPO/$ZIPKIN_DEPENDENCIES_VERSION/zipkin-dependencies-$ZIPKIN_DEPENDENCIES_VERSION.jar

# Copy CRON files
COPY periodic/ /etc/periodic/
# To run the dependency job once, run: ./run-job.sh from inside the container
# `docker-compose exec jhipster-zipkin ./run-job.sh`
COPY run-job.sh .

CMD crond -b && java ${JAVA_OPTS} -cp . org.springframework.boot.loader.JarLauncher
