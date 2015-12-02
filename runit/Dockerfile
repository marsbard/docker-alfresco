FROM marsbard/base

RUN touch /etc/inittab

RUN /install runit

COPY runit.sh /
RUN chmod +x /runit.sh

ENTRYPOINT ["/runit.sh"]


