# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/08 17:31:33 by ysaito            #+#    #+#              #
#    Updated: 2021/04/15 20:34:08 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN set -eux; \
		apk update; \
		apk add --no-cache \
			vsftpd \
			openssl \
			telegraf

RUN set -eux; \
		adduser -D admin42; \
		echo "admin42:admin42" | chpasswd

# Setup telegraf.conf
RUN set -eux; \
		telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf; \
		sed -i -e 's|hostname = ""|hostname = "ftps"|g' /etc/telegraf.conf; \
		sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

COPY ./srcs/vsftpd.conf /etc/vsftpd/
COPY ./srcs/setup.sh /tmp/

<<<<<<< HEAD
EXPOSE 20 21 21001-21010
=======
EXPOSE 20 21 21000-21009
>>>>>>> 5347c3071ea8fc67b86c9a767c4bab8cff5416d8

CMD ["bin/sh", "/tmp/setup.sh"]