set -me
./amc setup
scripts/run-skydock.sh
sleep 3
docker-compose -p alfresco up &
echo $! > /tmp/amc-pid
fg
