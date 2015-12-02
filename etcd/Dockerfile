FROM marsbard/base

RUN /apt-select/apt-select.py -p -t 5
RUN mv /sources.list /etc/apt

RUN apt-get update
RUN apt-get install -y curl

RUN curl -L https://github.com/coreos/etcd/releases/download/v2.2.2/etcd-v2.2.2-linux-amd64.tar.gz -o /tmp/etcd-v2.2.2-linux-amd64.tar.gz
RUN tar xzvf /tmp/etcd-v2.2.2-linux-amd64.tar.gz

EXPOSE 4001

WORKDIR /etcd-v2.2.2-linux-amd64
CMD ./etcd
