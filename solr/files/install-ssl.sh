#!/bin/bash
for x in templates/test templates/store workspace-SpacesStore archive-SpacesStore
do
	mkdir -p /data/${x}/conf 
done


cp "/keystore/ssl.repo.client.keystore" "/data/workspace-SpacesStore/conf/ssl.repo.client.keystore"
cp "/keystore/ssl.repo.client.truststore" "/data/workspace-SpacesStore/conf/ssl.repo.client.truststore"
cp "/keystore/ssl.repo.client.keystore" "/data/archive-SpacesStore/conf/ssl.repo.client.keystore"
cp "/keystore/ssl.repo.client.truststore" "/data/archive-SpacesStore/conf/ssl.repo.client.truststore"

cp "/keystore/ssl.repo.client.keystore" "/data/templates/test/conf/ssl.repo.client.keystore"
cp "/keystore/ssl.repo.client.truststore" "/data/templates/test/conf/ssl.repo.client.truststore"
cp "/keystore/ssl.repo.client.keystore" "/data/templates/store/conf/ssl.repo.client.keystore"
cp "/keystore/ssl.repo.client.truststore" "/data/templates/store/conf/ssl.repo.client.truststore"


