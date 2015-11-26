set -me
./mca setup
scripts/run-skydock.sh
sleep 3
docker-compose -p alfresco up $* &
echo $! > /tmp/mca-pid
fg
