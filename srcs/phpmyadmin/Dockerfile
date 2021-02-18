FROM alpine:latest

RUN set -eux;\
		apk update; \
		apk add --no-cache \
			nginx \
			php-fpm php7-json php7-mysqli php7-curl php7-iconv php7-mbstring php7-session;

#nginx setting file
COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf

#phpmyadmin setting file
COPY ./srcs/www.conf /etc/php7/php-fpm.d/www.conf
COPY ./srcs/setup.sh /tmp/       

RUN chmod 755 /tmp/setup.sh

CMD ["/tmp/setup.sh"]

EXPOSE 5000