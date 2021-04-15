# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:32:19 by ysaito            #+#    #+#              #
#    Updated: 2021/04/13 16:38:20 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN	set -eux; \
		apk update; \
		apk add --no-cache \
			mysql-client \
			nginx \
			openssl \
			php7-curl \
			php7-dom \
			php7-exif \
			php7-fileinfo \
			php-fpm \
			php7-iconv \
			php7-json \
			php7-mysqli \
			php7-phar \
			php7-xml \
			php7-zip \
			telegraf
#		mkdir -p /etc/telegraf

# Install wordpress
#RUN set -eux; \
#		wget http://wordpress.org/latest.tar.gz; \
#		tar -xzvf latest.tar.gz -C /var/www/; \
#		rm -r latest.tar.gz

# Install WP-CLI
RUN set -eux; \
		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
		chmod +x wp-cli.phar; \
		mv wp-cli.phar /usr/local/bin/wp

# nginx setting file
COPY ./srcs/nginx.conf /etc/nginx/
# worpdress setting file
COPY ./srcs/www.conf /etc/php7/php-fpm.d/
COPY ./srcs/setup.sh /tmp/

EXPOSE 5050

CMD ["/bin/sh", "/tmp/setup.sh"]

# memo
#mkdir /run/php/
#vi /etc/php7/php-fpm.d/www.conf
#usr/sbin/php-fpm7;
#killall -KILL php-fpm7;