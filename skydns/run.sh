
set -x

docker kill skydns
docker rm skydns

OPTS=""
#docker run -d --name skydns marsbard/skydns
docker run $OPTS --name skydns marsbard/skydns $*

