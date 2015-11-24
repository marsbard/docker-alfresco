FROM skurtzemann/tinydns


RUN apt-get update && apt-get -y remove netcat-openbsd && apt-get -y install netcat-traditional

EXPOSE 53
EXPOSE 8053

RUN mkdir -p /data/data.d
COPY files/tinydns.data /data
COPY files/axfrdns.tcp /data

COPY files/listener.sh /
COPY files/run-listener.sh /
COPY files/start.sh /
RUN chmod +x /*.sh

VOLUME /data

CMD /start.sh /run-listener.sh
