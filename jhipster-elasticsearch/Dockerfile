FROM elasticsearch:5.1.2-alpine

COPY elasticsearch.yml /usr/share/elasticsearch/config/

VOLUME ["/usr/share/elasticsearch/config"]
VOLUME ["/usr/share/elasticsearch/data"]

# Set environment variables
ENV ES_JAVA_OPTS "-Xms512m -Xmx512m"
ENV CLUSTER_NAME elasticsearch-default
ENV NODE_MASTER true
ENV NODE_DATA true
ENV NODE_INGEST true
ENV HTTP_ENABLE true
ENV NETWORK_HOST _site_
ENV HTTP_CORS_ENABLE true
ENV HTTP_CORS_ALLOW_ORIGIN *
ENV NUMBER_OF_MASTERS 1
ENV NUMBER_OF_SHARDS 1
ENV NUMBER_OF_REPLICAS 0
ENV MAX_LOCAL_STORAGE_NODES 1
# Set this to false if unable to set ulimit memlocks on your system
ENV BOOSTRAP_MEMORY_LOCK true

EXPOSE 9200 9300
EXPOSE 9200 9300