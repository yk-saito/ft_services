# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 17:51:53 by ysaito            #+#    #+#              #
#    Updated: 2021/04/15 20:31:00 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN set -eux; \
		apk update; \
		apk add --no-cache \
			influxdb \
			telegraf
#		mkdir -p /etc/telegraf

# Setup telegraf.conf
RUN set -eux; \
		telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf; \
		sed -i -e 's|hostname = ""|hostname = "influxdb"|g' /etc/telegraf.conf; \
		sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://localhost:8086"\]|g' /etc/telegraf.conf

COPY ./srcs/setup.sh /tmp/

EXPOSE 8086

CMD ["/bin/sh", "/tmp/setup.sh"]