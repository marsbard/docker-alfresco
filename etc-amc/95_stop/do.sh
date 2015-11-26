if [ -f /tmp/amc-pid ]
then

	PID=$( cat /tmp/amc-pid)
	echo Killing pid $PID
	kill $PID
	rm /tmp/amc-pid
fi

echo Stopping docker images related to alfresco
docker stop $(docker ps | grep alfresco | awk '{ print $1 }')
