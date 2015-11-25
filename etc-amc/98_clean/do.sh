CONTAINERS=$( docker ps -a | grep alfresco | awk '{ print $1 }')
if [ -n "$CONTAINERS" ]
then
  docker rm $CONTAINERS
fi
docker ps -a | grep marsbard/tomcat 2&>1 > /dev/null
if [ "$?" == "0" ]
then
	docker rm marsbard/tomcat
fi
