

if [ -z $1 ]
then
	echo Building marsbard/tomcat image
	docker build -t marsbard/tomcat ./tomcat
  echo Building composition
else
	echo Building $*
fi

docker-compose build $*
