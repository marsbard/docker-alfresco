FROM marsbard/base

RUN touch /etc/inittab

RUN /install runit

ENTRYPOINT ["/usr/sbin/runsvdir-start"]


