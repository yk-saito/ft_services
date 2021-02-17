FROM alpine:latest

RUN apk update && \
    apk add  --no-cache nginx openssh openssl

RUN /usr/bin/ssh-keygen -A && \
    adduser -D admin && \
    echo "admin:admin" | chpasswd

COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/localhost/htdocs/
COPY ./srcs/sshd_config /etc/ssh/
COPY ./srcs/setup.sh /tmp/

CMD ["/tmp/setup.sh"]

EXPOSE 80 443 22
