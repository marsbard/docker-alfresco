cd "`dirname $0`"
docker build -f Dockerfile.dev -t marsbard/tomcat .
