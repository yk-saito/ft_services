# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:31:42 by ysaito            #+#    #+#              #
#    Updated: 2021/04/06 17:31:49 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN set -eux; \
        apk update; \
        apk add --no-cache wget
RUN set -eux; \
        wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.4.3.linux-amd64.tar.gz; \
        tar -zxvf grafana-enterprise-7.4.3.linux-amd64.tar.gz
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

EXPOSE 3000

CMD [ "/grafana/bin/grafana-server --config=/grafana/conf/defaults.ini --homepath=/grafana" ]