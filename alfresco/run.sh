docker stop -t 120 alfresco-repo
docker rm alfresco-repo

docker run -d -p 80:8080 --name alfresco-repo marsbard/alfresco-repo

sleep 3

docker logs alfresco-repo

