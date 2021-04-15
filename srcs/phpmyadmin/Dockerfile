# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:32:09 by ysaito            #+#    #+#              #
#    Updated: 2021/04/13 16:39:03 by ysaito           ###   ########.fr        #
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
			telegraf
#		mkdir -p /etc/telegraf

# Install phpmyadmin
RUN set -eux; \
		mkdir -p /var/www//phpmyadmin; \
		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz; \
		tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz\
			--strip-components=1 -C /var/www//phpmyadmin/; \
		rm -r phpMyAdmin-5.0.4-all-languages.tar.gz

#nginx setting file
COPY ./srcs/nginx.conf /etc/nginx/

#phpmyadmin setting file
COPY ./srcs/www.conf /etc/php7/php-fpm.d/
COPY ./srcs/config.inc.php /var/www//phpmyadmin/
COPY ./srcs/setup.sh /tmp/

EXPOSE 5000

CMD ["/bin/sh", "/tmp/setup.sh"]