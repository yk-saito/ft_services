# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysaito <ysaito@student.42tokyo.jp>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/09 17:31:42 by ysaito            #+#    #+#              #
#    Updated: 2021/04/15 20:32:06 by ysaito           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

ENV GRAFANA_VER=7.4.3

RUN set -eux; \
		apk update; \
		apk add --no-cache \
			wget \
			openssl \
			telegraf
#		mkdir -p /etc/telegraf/

#  Install grafana
RUN set -eux; \
		wget https://dl.grafana.com/enterprise/release/grafana-enterprise-${GRAFANA_VER}.linux-amd64.tar.gz; \
		mkdir -p /var/lib/grafana; \
		tar -zxvf grafana-enterprise-${GRAFANA_VER}.linux-amd64.tar.gz --strip-components=1 -C /var/lib/grafana/; \
		rm -r grafana-enterprise-${GRAFANA_VER}.linux-amd64.tar.gz; \
		mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# Setup grafana
RUN set -eux; \
		sed -i -e "s|cert_file =|cert_file = /etc/ssl/certs/services.crt|g" /var/lib/grafana/conf/defaults.ini; \
		sed -i -e "s|cert_key =|cert_key = /etc/ssl/private/services.key|g" /var/lib/grafana/conf/defaults.ini

# Setup telegraf.conf
RUN set -eux; \
		telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf; \
		sed -i -e 's|hostname = ""|hostname = "grafana"|g' /etc/telegraf.conf; \
		sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

COPY ./srcs/datasources/datasource.yaml /var/lib/grafana/conf/provisioning/datasources/
COPY ./srcs/dashboards/dashboard.yaml /var/lib/grafana/conf/provisioning/dashboards/
COPY ./srcs/dashboards/ftps.json /var/lib/grafana/conf/provisioning/dashboards/
COPY ./srcs/dashboards/grafana.json /var/lib/grafana/conf/provisioning/dashboards/
COPY ./srcs/dashboards/influxdb.json /var/lib/grafana/conf/provisioning/dashboards/
COPY ./srcs/dashboards/mysql.json /var/lib/grafana/conf/provisioning/dashboards/
COPY ./srcs/dashboards/nginx.json /var/lib/grafana/conf/provisioning/dashboards/
COPY ./srcs/dashboards/phpmyadmin.json /var/lib/grafana/conf/provisioning/dashboards/
COPY ./srcs/dashboards/wordpress.json /var/lib/grafana/conf/provisioning/dashboards/
COPY ./srcs/setup.sh /tmp/

EXPOSE 3000

CMD ["/bin/sh", "/tmp/setup.sh"]