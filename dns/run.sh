

docker stop dns
docker rm dns

docker run -ti -h dns --name dns marsbard/dns bash


