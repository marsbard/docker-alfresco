

docker stop dns
docker rm dns

docker run -ti -p 8053:8053 -h dns --name dns marsbard/dns bash


