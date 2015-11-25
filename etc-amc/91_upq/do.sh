set -me
docker-compose -p alfresco up &
echo $! > /tmp/amc-pid
fg
