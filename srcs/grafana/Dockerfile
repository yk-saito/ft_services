# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 17:31:42 by ysaito            #+#    #+#              #
#    Updated: 2021/04/10 22:05:21 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

ENV GRAFANA_VER=7.4.3

RUN set -eux; \
        apk update; \
        apk add --no-cache \
        	wget \
        	telegraf; \
        mkdir -p /etc/telegraf/

#  Install & Setup grafana
RUN set -eux; \
        wget https://dl.grafana.com/enterprise/release/grafana-enterprise-${GRAFANA_VER}.linux-amd64.tar.gz; \
        mkdir -p /var/lib/grafana; \
        tar -zxvf grafana-enterprise-${GRAFANA_VER}.linux-amd64.tar.gz --strip-components=1 -C /var/lib/grafana/; \
        rm -r grafana-enterprise-${GRAFANA_VER}.linux-amd64.tar.gz; \
        mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

COPY ./srcs/datasources/datasource.yaml /var/lib/grafana/conf/provisioning/datasources/
COPY ./srcs/dashboards/dashboard.yaml /var/lib/grafana/conf/provisioning/dashboards
#COPY ./srcs/dashboards/ftps.json /var/lib/grafana/conf/provisioning/dashboards
#COPY ./srcs/dashboards/grafana.json /var/lib/grafana/conf/provisioning/dashboards
#COPY ./srcs/dashboards/influxdb.json /var/lib/grafana/conf/provisioning/dashboards
#COPY ./srcs/dashboards/mysql.json /var/lib/grafana/conf/provisioning/dashboards
COPY ./srcs/dashboards/nginx.json /var/lib/grafana/conf/provisioning/dashboards/nginx.json
#COPY ./srcs/dashboards/phpmyadmin.json /var/lib/grafana/conf/provisioning/dashboards/phpmyadmin.json
#COPY ./srcs/dashboards/wordpress.json /var/lib/grafana/conf/provisioning/dashboards
COPY ./srcs/telegraf.conf /etc/telegraf/

EXPOSE 3000

#CMD [ "/var/lib/grafana/bin/grafana-server", "--config=/var/lib/grafana/conf/defaults.ini",  "--homepath=/var/lib/grafana" ]
CMD [ "/var/lib/grafana/bin/grafana-server", "--homepath=/var/lib/grafana" ]