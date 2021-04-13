#!bin/sh

# Setup telegraf.conf
telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf
sed -i -e 's|hostname = ""|hostname = "influxdb"|g' /etc/telegraf.conf
sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

# Start telegraf
telegraf --config /etc/telegraf.conf &

# Start influxdb
#/usr/sbin/influxd & sleep 3
/usr/sbin/influxd

# Make database
#influx -e "CREATE DATABASE telegraf"
#influx -e "CREATE USER admin42 WITH PASSWORD 'admin42' WITH ALL PRIVILEGES"
#influx -e "GRANT ALL ON grafana TO admin42"

#tail -f /dev/null