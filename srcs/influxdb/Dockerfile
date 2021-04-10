# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:31:54 by ysaito            #+#    #+#              #
#    Updated: 2021/04/10 22:18:57 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN set -eux; \
		apk update; \
		apk add --no-cache \
			influxdb \
			telegraf; \
		mkdir -p /etc/telegraf

COPY ./srcs/telegraf.conf /etc/telegraf/
COPY ./srcs/setup.sh /tmp/

RUN chmod 755 /tmp/setup.sh

EXPOSE 8086

CMD ["/tmp/setup.sh"]