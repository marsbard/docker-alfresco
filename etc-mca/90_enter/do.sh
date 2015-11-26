set -e

CONTAINERS="alfresco share solr mysql postfix haveged"

if [ -z $1 ]
then
	echo Please supply the name of the container to enter, choose from:
	for c in $CONTAINERS
	do
		printf "\t > $c\n"
	done
	exit 1
fi

CONTAINER=alfresco_${1}_1

shift

TORUN=$*
if [ -z $TORUN ]
then
	TORUN='/bin/bash'
fi

printf "\t>>> Entering $CONTAINER and running $TORUN\n\n"
docker exec -ti $CONTAINER $TORUN

