FROM skurtzemann/tinydns

VOLUME /data

RUN apt-get update && apt-get install -y--no-install-recommends \
  python-pip

RUN pip install docker-py

COPY files/watchdock.py /


COPY files/axfrdns.tcp /tmp
COPY files/tinydns.data /tmp
COPY files/setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD /setup.sh

