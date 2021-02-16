FROM alpine:latest

RUN	apk update && \
	apk add php-fpm php7-json php7-mysqli php7-curl

COPY ./srcs/wp-config.php /var/www/html/wordpress/
COPY ./srcs/www.conf /etc/php7/php-fpm.d/www.conf
COPY ./srcs/setup.sh /tmp/

CMD ["chmod", "+x", "/tmp/setup.sh"]

EXPOSE 5050


##memo
# mkdir /run/php/

# vi /etc/php7/php-fpm.d/www.conf

# usr/sbin/php-fpm7;
# killall -KILL php-fpm7;