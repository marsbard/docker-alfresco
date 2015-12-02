FROM marsbard/runit

RUN /nearest-mirror.sh

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


WORKDIR /go/src/github.com/skynetservices/skydns
RUN go build -v

RUN wget https://github.com/coreos/etcd/releases/download/v2.2.2/etcd-v2.2.2-linux-amd64.tar.gz -O /tmp/etcd-v2.2.2-linux-amd64.tar.gz
WORKDIR /
RUN tar xzvf /tmp/etcd-v2.2.2-linux-amd64.tar.gz

RUN mkdir -p /etc/service/etcd/log
RUN mkdir -p /etc/service/skydns/log
RUN mkdir -p /log/etcd /log/skydns

COPY skydns/run /etc/service/skydns/run
RUN chmod +x /etc/service/skydns/run

COPY skydns/log /etc/service/skydns/log/run
RUN chmod +x /etc/service/skydns/log/run

COPY etcd/run /etc/service/etcd/run
RUN chmod +x /etc/service/etcd/run

COPY etcd/log /etc/service/etcd/log/run
RUN chmod +x /etc/service/etcd/log/run

WORKDIR /

#CMD [ "/runit.sh" ]
