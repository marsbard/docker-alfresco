FROM marsbard/base

RUN apt-get update && apt-get -y --no-install-recommends install libreoffice supervisor

RUN mkdir -p /var/log/supervisor 
ADD files/supervisor.conf /etc/supervisor/conf.d/supervisor.conf 
#ADD fonts /usr/share/ 
EXPOSE 8999 
CMD ["/usr/bin/supervisord"] 
