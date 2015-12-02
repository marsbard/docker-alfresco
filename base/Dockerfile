FROM ubuntu:trusty

RUN apt-get update -y 

RUN echo apt-get -y --no-install-recommends install \$1 > /install
RUN chmod +x /install

RUN /install git
RUN /install ca-certificates
RUN git clone https://github.com/jblakeman/apt-select.git

RUN /install python
RUN /install 'python(3?)-bs4$'

RUN /apt-select/apt-select.py -p -t 5
RUN mv /sources.list /etc/apt

RUN apt-get update

RUN /install wget 
RUN /install telnet 
RUN /install dnsutils
RUN /install software-properties-common
RUN /install netcat-traditional 

