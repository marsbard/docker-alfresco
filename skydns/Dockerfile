FROM marsbard/supervisor

RUN /apt-select/apt-select.py -p -t 5
RUN mv /sources.list /etc/apt
RUN apt-get update 

RUN /install git
RUN /install wget

WORKDIR /tmp
RUN wget https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz 
WORKDIR /usr/local
RUN tar xzvf /tmp/go*.tar.gz
RUN rm /tmp/go*.tar.gz

ENV PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/go/bin

ENV GOPATH=/go
RUN mkdir /go
RUN go version
RUN go get github.com/skynetservices/skydns 



RUN wget https://github.com/coreos/etcd/releases/download/v2.2.2/etcd-v2.2.2-linux-amd64.tar.gz -O /tmp/etcd-v2.2.2-linux-amd64.tar.gz
RUN tar xzvf /tmp/etcd-v2.2.2-linux-amd64.tar.gz
COPY etcd.sv.conf /etc/supervisor/conf.d
COPY run-etcd.sh /
RUN chmod +x /run-etcd.sh


WORKDIR /go/src/github.com/skynetservices/skydns

RUN go build -v

CMD ./skydns -discover

