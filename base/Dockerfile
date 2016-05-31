FROM ubuntu:14.04

# http://layer0.authentise.com/docker-4-useful-tips-you-may-not-know-about.html
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" > /etc/apt/sources.list && \
  echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" >> /etc/apt/sources.list && \
	DEBIAN_FRONTEND=noninteractive apt-get update


RUN apt-get update && apt-get install --no-install-recommends -y \
     python-pip \
     libapr1 \
     libaprutil1 \
     libapr1-dev \
     libaprutil1-dev \
     libpcre++0 \
     libssl1.0.0 \
     libaugeas0 \
     libssl-dev \
     libffi-dev \
		 wget curl telnet dnsutils software-properties-common netcat-traditional git \
	   ca-certificates

