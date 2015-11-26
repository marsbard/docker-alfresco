
echo Building marsbard/tomcat image
docker build -t marsbard/tomcat ./tomcat

echo Building composition
docker-compose build
