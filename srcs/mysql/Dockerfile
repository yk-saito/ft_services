FROM alpine:latest

RUN apk update && \
    apk add mysql mysql-client

COPY ./srcs/my.cnf /etc/
COPY ./srcs/setup.sh ./srcs/init.sql /tmp/

#RUN mkdir -p /run/mysqld

# MySQL init datadir and make system table
#RUN mysql_install_db

EXPOSE 3306

#start mysql daemon
#CMD [ "/usr/bin/mysqld" ]

CMD ["/tmp/setup.sh"]