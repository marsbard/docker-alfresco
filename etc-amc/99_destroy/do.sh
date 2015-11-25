
./amc stop 2&>1 > /dev/null

./amc clean 2&>1 > /dev/null

echo --- destroying images ---

set -x 
for image in alfresco_alfresco alfresco_share alfresco_solr marsbard/tomcat mysql \
	ubuntu-upstart harbur/haveged catatnight/postfix crosbymichael/skydock crosbymichael/skydns
do
	echo $image
	docker images | grep $image 2>&1 > /dev/null
	if [ $? == 0 ]
	then
		echo Removing $image
		docker rmi $image
	fi
done
