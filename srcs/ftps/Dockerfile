FROM alpine:latest

RUN set -eux; \
		apk update; \
		apk add --no-cache vsftpd openssl

RUN set -eux; \
    	adduser -D admin42; \
    	echo "admin42:admin42" | chpasswd

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./srcs/setup.sh /tmp/

RUN chmod 755 /tmp/setup.sh

CMD ["tmp/setup.sh"]

EXPOSE 21 21000-21010