FROM alpine:latest
MAINTAINER Mariel Donila <mariel.donila@gmail.com>

RUN apk update && apk upgrade && \ 
    apk add freeradius freeradius-mysql && \
    rm -rf /var/cache/* && \
    chgrp radius /usr/sbin/radiusd && \
    ln -s /etc/raddb/mods-available/sql /etc/raddb/mods-enabled/sql && \
    sed -ri 's/\"rlm_sql_null\"/\"rlm_sql_mysql\"/g' /etc/raddb/mods-enabled/sql && \
    sed -ri 's/\"localhost\"/\"radius-mysql\"/g' /etc/raddb/mods-enabled/sql && \
    sed -ri 's/\"sqlite\"/\"mysql\"/g' /etc/raddb/mods-enabled/sql && \
    sed -ri '/^#.*server/ s/^#//' /etc/raddb/mods-enabled/sql && \
    sed -ri '/^#.*password/ s/^#//' /etc/raddb/mods-enabled/sql && \
    sed -ri 's/\"radpass\"/\"badam\"/g' /etc/raddb/mods-enabled/sql && \
    sed -ri '/^#.*read_clients/ s/^#//' /etc/raddb/mods-enabled/sql
COPY conf/default /etc/raddb/sites-available/default

CMD ["/usr/sbin/radiusd","-X","-f"]
