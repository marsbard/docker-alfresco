# Didn't really want to start my own Dockerfile but I can't find my way out
# of this:
#
# registrator needs to have net: host to talk to docker daemon and so 
# cannot use link to consul to ensure that consul starts first
#
# if registrator starts before consul is ready it dies :-(
#
# so I just need to wait a bit, or ideally check for consul to be up

FROM gliderlabs/registrator

COPY files/start.sh /start.sh
RUN chmod +x /start.sh

#CMD ["/start.sh"] 

ENTRYPOINT "/start.sh"
