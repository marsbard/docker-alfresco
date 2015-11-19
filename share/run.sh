docker stop -t 120 alfresco-share
docker rm alfresco-share

docker run -d -p 80:8080 --name alfresco-share marsbard/alfresco-share

sleep 3

docker logs alfresco-share

