# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/05 17:35:10 by ysaito            #+#    #+#              #
#    Updated: 2021/04/19 15:20:57 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN set -eux; \
		apk update; \
		apk add --no-cache \
			nginx \
			openssh \
			openssl \
			telegraf; \
		mkdir -p /run/nginx/

RUN set -eux; \
		/usr/bin/ssh-keygen -A; \
    	adduser -D admin42; \
    	echo "admin42:admin42" | chpasswd

# Setup telegraf.conf
RUN set -eux; \
		telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf; \
		sed -i -e 's|hostname = ""|hostname = "nginx"|g' /etc/telegraf.conf; \
		sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

COPY ./srcs/default.conf /etc/nginx/conf.d/
COPY ./srcs/index.html /var/www/
COPY ./srcs/sshd_config /etc/ssh/
COPY ./srcs/setup.sh /tmp/

EXPOSE 80 443 22

CMD ["/bin/sh", "/tmp/setup.sh"]