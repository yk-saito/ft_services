FROM alpine:latest

RUN set -eux; \
		apk update; \
		apk add --no-cache nginx openssh openssl

RUN set -eux; \
		/usr/bin/ssh-keygen -A; \
    	adduser -D admin42; \
    	echo "admin42:admin42" | chpasswd

COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/localhost/htdocs/
COPY ./srcs/sshd_config /etc/ssh/
COPY ./srcs/setup.sh /tmp/

RUN chmod 755 /tmp/setup.sh

CMD ["/tmp/setup.sh"]

EXPOSE 80 443 22
