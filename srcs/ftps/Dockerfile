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

#RUN set -eux; \
#		adduser -D admin42; \
#		echo "admin42:admin42" | chpasswd

# ftps setup
#RUN mkdir -p /etc/ftps/ftp_user; \
#RUN	adduser --home=/etc/ftps/ftp_user -D admin42; \
RUN	adduser -D admin42; \
	echo "admin42:admin42" | chpasswd; \
	echo "admin42" >> /etc/vsftpd/user_list; \
	echo "admin42" >> /etc/vsftpd/chroot_list

# Setup telegraf.conf
RUN set -eux; \
		telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf; \
		sed -i -e 's|hostname = ""|hostname = "ftps"|g' /etc/telegraf.conf; \
		sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

COPY ./srcs/vsftpd.conf /etc/vsftpd/
COPY ./srcs/setup.sh /tmp/

EXPOSE 21 50000-50003

CMD ["bin/sh", "/tmp/setup.sh"]