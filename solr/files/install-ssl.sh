#!/bin/bash
for x in templates/test templates/store workspace-SpacesStore archive-SpacesStore
do
	mkdir -p /data/${x}/conf 
done

for x in ssl.repo.client.keystore ssl.repo.client.truststore ssl-keystore-passwords.properties ssl-truststore-passwords.properties
do
	cp /keystore/${x} /data/workspace-SpacesStore/conf/${x}
	cp /keystore/${x} /data/archive-SpacesStore/conf/${x}
	cp /keystore/${x} /data/templates/test/conf/${x}
	cp /keystore/${x} /data/templates/store/conf/${x}
done
