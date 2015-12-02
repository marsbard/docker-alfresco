docker kill etcd
docker rm etcd

docker run --name etcd -p 4001:4001 marsbard/etcd

docker logs etcd

sleep 3

docker logs etcd

