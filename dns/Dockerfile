FROM skurtzemann/tinydns

VOLUME /data

EXPOSE 53
EXPOSE 8053


COPY listener.sh /
COPY run-listener.sh /
COPY start.sh /
RUN chmod +x /*.sh


# tinydns uses a 'data' file, unfortunate clash with my 'data' naming convention for the data volume.
# gonna make the listener write to separate records in data.d and concatenate them all into a data
# file to be converted into tinydns config
RUN mkdir -p /data/data.d


CMD /start.sh /run-listener.sh
