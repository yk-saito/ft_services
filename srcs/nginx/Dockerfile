FROM alpine:latest

RUN apk update \
    && apk add nginx

COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/html/
COPY ./srcs/setup.sh /tmp/

CMD ["/tmp/setup.sh"]

EXPOSE 80