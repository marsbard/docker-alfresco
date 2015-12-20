FROM gliderlabs/consul-server

COPY ./config /tmp/config/
COPY runner.sh /
RUN chmod +x runner.sh

ENTRYPOINT [ "/runner.sh", "/bin/consul", "agent", "-server", "-config-dir=/config"]
