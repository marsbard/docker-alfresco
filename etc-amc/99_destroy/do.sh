
./amc stop 2>&1 > /dev/null

./amc clean 2>&1 > /dev/null

echo --- destroying images ---

for image in alfresco_alfresco alfresco_share alfresco_solr 
do
	echo $image
	if docker images | grep $image 
	then
		echo Removing $image
		docker rmi $image
	fi
done
