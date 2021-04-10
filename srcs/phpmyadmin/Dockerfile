# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:32:09 by ysaito            #+#    #+#              #
#    Updated: 2021/04/10 22:14:36 by ysaito           ###   ########.fr        #
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

#nginx setting file
COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf

#phpmyadmin setting file
COPY ./srcs/www.conf /etc/php7/php-fpm.d/www.conf
COPY ./srcs/setup.sh /tmp/

#telegraf settinig file
COPY ./srcs/telegraf.conf /etc/telegraf/

RUN chmod 755 /tmp/setup.sh

EXPOSE 5000

CMD ["/tmp/setup.sh"]