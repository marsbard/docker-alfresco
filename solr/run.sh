docker stop -t 120 alfresco-solr
docker rm alfresco-solr

docker run -d -p 80:8080 --name alfresco-solr marsbard/alfresco-solr

sleep 3

docker logs alfresco-solr

