
set -x

docker kill skydns
docker rm skydns

OPTS="--link=etcd"
#docker run -d --name skydns marsbard/skydns
docker run $OPTS --name skydns marsbard/skydns


docker logs skydns

sleep 3

docker logs skydns

