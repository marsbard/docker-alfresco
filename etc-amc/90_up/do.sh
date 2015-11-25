set -m
docker-compose up &
echo $! > /tmp/amc-pid
fg
