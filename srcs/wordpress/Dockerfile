# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:32:19 by ysaito            #+#    #+#              #
#    Updated: 2021/04/07 16:44:55 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN	apk update && \
	apk add --no-cache nginx openssl php-fpm php7-json php7-mysqli php7-curl

#nginx setting file
COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
#worpdress setting file
COPY ./srcs/wp-config.php /var/www/localhost/htdocs/wordpress/
COPY ./srcs/www.conf /etc/php7/php-fpm.d/www.conf
COPY ./srcs/setup.sh /tmp/

RUN chmod 755 /tmp/setup.sh

CMD ["/tmp/setup.sh"]

EXPOSE 5050


##memo
# mkdir /run/php/

# vi /etc/php7/php-fpm.d/www.conf

# usr/sbin/php-fpm7;
# killall -KILL php-fpm7;