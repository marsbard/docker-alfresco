docker kill tomcat
docker rm tomcat

docker run -d --name tomcat marsbard/tomcat

docker logs tomcat

sleep 3

docker logs tomcat

