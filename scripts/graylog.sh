#!/bin/bash

ES_ID=$(docker run -d -p 9200:9200 -p 9300:9300 himedia/elasticsearch)
ES_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${ES_ID})

docker run -d -p 8080:80 -e "ES_HOST=localhost" -e "ES_PORT=9200" arcus/kibana

docker run -d -p 9000:9000 -p 12201:12201 -p 12201:12201/udp -p 12900:12900 -p 27017:27017 -p 28017:28017 \
	    -e "ES_CLUSTER_NAME=graylog" -e "ES_CLUSTER_HOSTS=$ES_IP:9300" himedia/graylog2
