#!bin/sh

# Setup MySQL (init datadir and make system table)
mkdir -p /run/mysqld
mysql_install_db

# Setup telegraf.conf
telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf
sed -i -e 's|hostname = ""|hostname = "mysql"|g' /etc/telegraf.conf
sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

# Start telegraf
telegraf --config /etc/telegraf.conf &

# Start mysql daemon
/usr/bin/mysqld