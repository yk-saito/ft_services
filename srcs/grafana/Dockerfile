FROM alpine:latest

RUN set -eux; \
        apk update; \
        apk add --no-cache wget
RUN set -eux; \
        wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.4.3.linux-amd64.tar.gz; \
        tar -zxvf grafana-enterprise-7.4.3.linux-amd64.tar.gz
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

EXPOSE 3000

CMD [ "/grafana/bin/grafana-server --config=/grafana/conf/defaults.ini --homepath=/grafana" ]