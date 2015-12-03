FROM ubuntu:trusty

ENV DEBIAN_FRONTEND=noninteractive

RUN echo apt-get -y --no-install-recommends install \$* > /install
RUN chmod +x /install

RUN apt-get update

RUN /install wget curl telnet dnsutils software-properties-common netcat-traditional git \
	ca-certificates

COPY files/register-ns.sh /
RUN chmod +x /register-ns.sh
