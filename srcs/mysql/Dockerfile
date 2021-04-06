# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:31:14 by ysaito            #+#    #+#              #
#    Updated: 2021/04/06 17:31:23 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update && \
    apk add mysql mysql-client

COPY ./srcs/my.cnf /etc/
COPY ./srcs/setup.sh ./srcs/init.sql /tmp/

EXPOSE 3306

CMD ["/tmp/setup.sh"]