if [ -f /tmp/amc-pid ]
then

	PID=$( cat /tmp/amc-pid)
	echo Killing $PID
	kill $PID
	rm /tmp/amc-pid
fi

docker stop $(docker ps | grep alfresco | awk '{ print $1 }')
