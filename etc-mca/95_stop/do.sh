if [ -f /tmp/mca-pid ]
then

	PID=$( cat /tmp/mca-pid)
	echo Killing pid $PID
	kill $PID
	rm /tmp/mca-pid
fi

echo Stopping docker images related to alfresco
docker stop $(docker ps | grep alfresco | awk '{ print $1 }')
