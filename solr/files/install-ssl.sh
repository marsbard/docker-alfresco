#!/bin/bash

cp "/keystore/ssl.repo.client.keystore" "/data/workspace-SpacesStore/conf/ssl.repo.client.keystore"
cp "/keystore/ssl.repo.client.truststore" "/data/workspace-SpacesStore/conf/ssl.repo.client.truststore"
cp "/keystore/ssl.repo.client.keystore" "/data/archive-SpacesStore/conf/ssl.repo.client.keystore"
cp "/keystore/ssl.repo.client.truststore" "/data/archive-SpacesStore/conf/ssl.repo.client.truststore"

mkdir -p /data/templates/test/conf /data/templates/store/conf
cp "/keystore/ssl.repo.client.keystore" "/data/templates/test/conf/ssl.repo.client.keystore"
cp "/keystore/ssl.repo.client.truststore" "/data/templates/test/conf/ssl.repo.client.truststore"
cp "/keystore/ssl.repo.client.keystore" "/data/templates/store/conf/ssl.repo.client.keystore"
cp "/keystore/ssl.repo.client.truststore" "/data/templates/store/conf/ssl.repo.client.truststore"


