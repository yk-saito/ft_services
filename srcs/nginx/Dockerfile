# *********************************************************************#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:30:57 by ysaito            #+#    #+#              #
#    Updated: 2021/04/07 16:50:43 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN set -eux; \
		apk update; \
		apk add --no-cache \
			nginx \
			openssh openssl \
			telegraf; \
		mkdir -p /etc/telegraf

RUN set -eux; \
		/usr/bin/ssh-keygen -A; \
    	adduser -D admin42; \
    	echo "admin42:admin42" | chpasswd

COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/index.html /var/www/index.html
COPY ./srcs/sshd_config /etc/ssh/sshd_config
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/setup.sh /tmp/setup.sh

RUN chmod 755 /tmp/setup.sh

EXPOSE 80 443 22

CMD ["/tmp/setup.sh"]