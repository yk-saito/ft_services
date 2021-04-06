# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:31:54 by ysaito            #+#    #+#              #
#    Updated: 2021/04/06 17:32:02 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update; \
	apk add --no-cache influxdb

COPY ./srcs/setup.sh /tmp/

RUN chmod 755 /tmp/set.sh

CMD ["/tmp/setup.sh"]

EXPOSE 8086