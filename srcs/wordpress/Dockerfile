# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/06 17:32:19 by ysaito            #+#    #+#              #
#    Updated: 2021/04/19 15:17:32 by ysaito           ###   ########.fr        #
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
			telegraf; \
		mkdir /run/nginx/; \
		mkdir /run/php/

# Install WP-CLI & wordpress
RUN set -eux; \
		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
		chmod +x wp-cli.phar; \
		mv wp-cli.phar /usr/local/bin/wp; \
		wp core download --path=/var/www/wordpress/ --locale=ja; \
		chown -R nginx:nginx /var/www/wordpress/

# Setup telegraf.conf
RUN set -eux; \
		telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf; \
		sed -i -e 's|hostname = ""|hostname = "wordpress"|g' /etc/telegraf.conf; \
		sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

COPY ./srcs/default.conf /etc/nginx/conf.d/
COPY ./srcs/www.conf /etc/php7/php-fpm.d/
COPY ./srcs/setup.sh /tmp/

EXPOSE 5050

CMD ["/bin/sh", "/tmp/setup.sh"]