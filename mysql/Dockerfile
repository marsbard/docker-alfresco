FROM mysql:5.6

COPY register-ns.sh /
RUN chmod +x /register-ns.sh

COPY start.sh /
RUN chmod +x /start.sh

CMD /start.sh
