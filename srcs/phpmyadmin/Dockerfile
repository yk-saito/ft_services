# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:32:09 by ysaito            #+#    #+#              #
#    Updated: 2021/04/11 20:15:33 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN set -eux;\
		apk update; \
		apk add --no-cache \
			nginx \
			openssl \
			php-fpm php7-json php7-mysqli php7-curl php7-iconv php7-mbstring php7-session \
			telegraf; \
		mkdir -p /etc/telegraf

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
COPY ./srcs/www.conf /etc/php7/php-fpm.d/www.conf
COPY ./srcs/config.inc.php /var/www//phpmyadmin/
COPY ./srcs/setup.sh /tmp/

#telegraf settinig file
COPY ./srcs/telegraf.conf /etc/telegraf/

RUN chmod 755 /tmp/setup.sh

EXPOSE 5000

CMD ["/tmp/setup.sh"]