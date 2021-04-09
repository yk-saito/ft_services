# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:31:42 by ysaito            #+#    #+#              #
#    Updated: 2021/04/09 15:13:39 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

ENV GRAFANA_VER=7.4.3

RUN set -eux; \
        apk update; \
        apk add --no-cache wget
RUN set -eux; \
        wget https://dl.grafana.com/enterprise/release/grafana-enterprise-${GRAFANA_VER}.linux-amd64.tar.gz; \
        mkdir -p /grafana; \
        tar -zxvf grafana-enterprise-${GRAFANA_VER}.linux-amd64.tar.gz --strip-components=1 -C /grafana/; \
        rm -r grafana-enterprise-${GRAFANA_VER}.linux-amd64.tar.gz; \
        mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# /grafana/conf/provisioning/datasources

EXPOSE 3000

CMD [ "/grafana/bin/grafana-server", "--config=/grafana/conf/defaults.ini",  "--homepath=/grafana" ]