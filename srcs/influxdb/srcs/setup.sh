#!bin/sh

# Start telegraf
telegraf --config /etc/telegraf.conf &

# Start influxdb
/usr/sbin/influxd