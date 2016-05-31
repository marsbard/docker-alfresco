FROM marsbard/base


# http://layer0.authentise.com/docker-4-useful-tips-you-may-not-know-about.html
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" > /etc/apt/sources.list && \
  echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" >> /etc/apt/sources.list && \
	DEBIAN_FRONTEND=noninteractive apt-get update


RUN add-apt-repository -y ppa:libreoffice/ppa
RUN apt-get update && apt-get -y --no-install-recommends install libreoffice supervisor libxinerama1 libdbus-glib-1-2

RUN mkdir -p /var/log/supervisor 
ADD files/supervisor.conf /etc/supervisor/conf.d/supervisor.conf 
#ADD fonts /usr/share/ 
EXPOSE 8999 
CMD ["/usr/bin/supervisord"] 
