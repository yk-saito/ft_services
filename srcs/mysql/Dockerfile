

FROM alpine:latest

RUN apk update && \
    apk add mysql mysql-client

COPY ./srcs/my.cnf /etc/
COPY ./srcs/setup.sh ./srcs/init.sql /tmp/

EXPOSE 3306

CMD ["/tmp/setup.sh"]