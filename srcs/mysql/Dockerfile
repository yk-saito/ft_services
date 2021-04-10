# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:31:14 by ysaito            #+#    #+#              #
#    Updated: 2021/04/10 22:14:42 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN set -eux; \
        apk update; \
        apk add --no-cache \
            mysql mysql-client \
            telegraf; \
        mkdir -p /etc/telegraf/
    
COPY ./srcs/my.cnf /etc/
COPY ./srcs/telegraf.conf /etc/telegraf/
COPY ./srcs/setup.sh ./srcs/init.sql /tmp/

RUN chmod 755 /tmp/setup.sh

EXPOSE 3306

CMD ["/tmp/setup.sh"]