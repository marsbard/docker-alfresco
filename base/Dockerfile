FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive

RUN echo apt-get -y --no-install-recommends install \$* > /install
RUN chmod +x /install

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y \
     python-pip \
     libapr1 \
     libaprutil1 \
     libapr1-dev \
     libaprutil1-dev \
     libpcre++0 \
     libssl1.0.0 \
     libaugeas0 \
     libssl-dev \
     libffi-dev

RUN /install wget curl telnet dnsutils software-properties-common netcat-traditional git \
	ca-certificates

