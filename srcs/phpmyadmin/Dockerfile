# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/05 17:31:14 by ysaito            #+#    #+#              #
#    Updated: 2021/04/15 20:22:07 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN set -eux;\
		apk update; \
		apk add --no-cache \
			nginx \
			openssl \
			php7-curl \
			php-fpm \
			php7-iconv \
			php7-json \
			php7-mbstring \
			php7-mysqli \
			php7-session \
			telegraf; \
		mkdir /run/nginx/; \
		mkdir /run/php/

# Install phpmyadmin
RUN set -eux; \
		mkdir -p /var/www//phpmyadmin; \
		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz; \
		tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz\
			--strip-components=1 -C /var/www//phpmyadmin/; \
		rm -r phpMyAdmin-5.0.4-all-languages.tar.gz; \
		chown -R nginx:nginx /var/www/

# Setup telegraf.conf
RUN set -eux; \
		telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf; \
		sed -i -e 's|hostname = ""|hostname = "phpmyadmin"|g' /etc/telegraf.conf; \
		sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

COPY ./srcs/nginx.conf /etc/nginx/
COPY ./srcs/www.conf /etc/php7/php-fpm.d/
COPY ./srcs/config.inc.php /var/www//phpmyadmin/
COPY ./srcs/setup.sh /tmp/

EXPOSE 5000

CMD ["/bin/sh", "/tmp/setup.sh"]