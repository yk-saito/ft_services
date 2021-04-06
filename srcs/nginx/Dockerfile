# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:30:57 by ysaito            #+#    #+#              #
#    Updated: 2021/04/06 17:31:03 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN set -eux; \
		apk update; \
		apk add --no-cache nginx openssh openssl

RUN set -eux; \
		/usr/bin/ssh-keygen -A; \
    	adduser -D admin42; \
    	echo "admin42:admin42" | chpasswd

COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/localhost/htdocs/
COPY ./srcs/sshd_config /etc/ssh/
COPY ./srcs/setup.sh /tmp/

RUN chmod 755 /tmp/setup.sh

CMD ["/tmp/setup.sh"]

EXPOSE 80 443 22
