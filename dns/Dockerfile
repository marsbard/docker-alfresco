FROM skurtzemann/tinydns


RUN apt-get update && apt-get -y remove netcat-openbsd && \
	apt-get -y install netcat-traditional curl wget telnet python-pip

RUN pip install cherrypy

EXPOSE 53
EXPOSE 8053

COPY files/tinydns.data /tmp
COPY files/axfrdns.tcp /tmp

COPY files/listener.py /
COPY files/start.sh /
RUN chmod +x /*.sh /*.py

VOLUME /data

CMD /start.sh /listener.py
