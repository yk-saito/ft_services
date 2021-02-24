FROM alpine:latest

RUN apk update; \
	apk add --no-cache influxdb

COPY ./srcs/setup.sh /tmp/

RUN chmod 755 /tmp/set.sh

CMD ["/tmp/setup.sh"]

EXPOSE 8086