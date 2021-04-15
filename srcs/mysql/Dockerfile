# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:31:14 by ysaito            #+#    #+#              #
#    Updated: 2021/04/13 16:41:31 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN set -eux; \
        apk update; \
        apk add --no-cache \
            mysql \
            mysql-client \
            telegraf; \
        mkdir -p /etc/telegraf/

COPY ./srcs/my.cnf /etc/
COPY ./srcs/setup.sh ./srcs/init.sql /tmp/

EXPOSE 3306

CMD ["bin/sh", "/tmp/setup.sh"]