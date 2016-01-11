docker kill httpd
docker rm httpd

docker run -d --name httpd digcat/httpd

docker logs httpd

sleep 3

docker logs httpd

