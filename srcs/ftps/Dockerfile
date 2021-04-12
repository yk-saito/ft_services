# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:31:33 by ysaito            #+#    #+#              #
#    Updated: 2021/04/10 22:14:51 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN set -eux; \
		apk update; \
		apk add --no-cache \
			vsftpd \ 
			openssl \
			telegraf; \
		mkdir -p /etc/telegraf/

RUN set -eux; \
    	adduser -D admin42; \
    	echo "admin42:admin42" | chpasswd

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/setup.sh /tmp/setup.sh

RUN chmod 755 /tmp/setup.sh

CMD ["/tmp/setup.sh"]

EXPOSE 21 21000-21010