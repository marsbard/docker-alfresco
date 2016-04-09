FROM marsbard/base
RUN add-apt-repository -y ppa:libreoffice/ppa
RUN apt-get update && apt-get -y --no-install-recommends install libreoffice supervisor libxinerama1 libdbus-glib-1-2

RUN mkdir -p /var/log/supervisor 
ADD files/supervisor.conf /etc/supervisor/conf.d/supervisor.conf 
#ADD fonts /usr/share/ 
EXPOSE 8999 
CMD ["/usr/bin/supervisord"] 
