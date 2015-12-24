FROM marsbard/tomcat

COPY files/generate_keystores.sh /keystore/
RUN chmod +x /keystore/generate_keystores.sh
RUN /keystore/generate_keystores.sh

