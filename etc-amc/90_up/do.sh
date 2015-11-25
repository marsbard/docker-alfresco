set -me
./amc getdeps
./amc pull
./amc buildimages
./amc setup
./amc build
docker-compose -p alfresco up &
echo $! > /tmp/amc-pid
fg
