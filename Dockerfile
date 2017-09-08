FROM cassandra:3.11

# copy default config template
COPY cassandra.yaml /cassandra.yaml.default

# override entrypoint from base image
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN mkdir -p /var/lib/cassandra.conf \
    && chown -R cassandra:cassandra /var/lib/cassandra.conf \
    && chmod 777 /var/lib/cassandra.conf

VOLUME /var/lib/cassandra.conf
