set -m
./amc getdeps
./amc pull
./amc buildimages
docker-compose -p alfresco up &
echo $! > /tmp/amc-pid
fg
