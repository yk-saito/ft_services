# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/06 17:31:35 by ysaito            #+#    #+#              #
#    Updated: 2021/04/15 20:28:53 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN set -eux; \
		apk update; \
		apk add --no-cache \
			mysql \
			mysql-client \
			telegraf
		#mkdir -p /etc/telegraf/

# Setup telegraf.conf
RUN set -eux; \
		telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf; \
		sed -i -e 's|hostname = ""|hostname = "mysql"|g' /etc/telegraf.conf; \
		sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

COPY ./srcs/my.cnf /etc/
COPY ./srcs/setup.sh ./srcs/init.sql /tmp/

EXPOSE 3306

CMD ["bin/sh", "/tmp/setup.sh"]