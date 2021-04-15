#!bin/sh
DASHBOARDS_DIR=/var/lib/grafana/conf/provisioning/dashboards/

# SSL
openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 -subj "/C=JP/ST=TOkyo/L=Minato-City/O=42Tokyo/OU=./CN=localhost" -keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt
sed -i -e "s|protocol = http|protocol = https|g" /var/lib/grafana/conf/defaults.ini
sed -i -e "s|cert_file =|cert_file = /etc/ssl/certs/services.crt|g" /var/lib/grafana/conf/defaults.ini
sed -i -e "s|cert_key =|cert_key = /etc/ssl/private/services.key|g" /var/lib/grafana/conf/defaults.ini

# Copy and edit dashboards json file
cp $DASHBOARDS_DIR/nginx.json $DASHBOARDS_DIR/mysql.json
sed -i -e 's|"value": "nginx"|"value": "mysql"|g' $DASHBOARDS_DIR/mysql.json
cp $DASHBOARDS_DIR/nginx.json $DASHBOARDS_DIR/wordpress.json
sed -i -e 's|"value": "nginx"|"value": "wordpress"|g' $DASHBOARDS_DIR/wordpress.json
cp $DASHBOARDS_DIR/nginx.json $DASHBOARDS_DIR/grafana.json
sed -i -e 's|"value": "nginx"|"value": "grafana"|g' $DASHBOARDS_DIR/grafana.json

# Setup telegraf.conf
telegraf config --input-filter cpu:mem --output-filter influxdb > /etc/telegraf.conf
sed -i -e 's|hostname = ""|hostname = "grafana"|g' /etc/telegraf.conf
sed -i -e 's|# urls = \["http://127.0.0.1:8086"\]|urls = \["http://influxdb-svc:8086"\]|g' /etc/telegraf.conf

# Start telegraf
telegraf --config /etc/telegraf.conf &

# Start SSH
/usr/sbin/sshd

# Start grafana
/var/lib/grafana/bin/grafana-server --homepath=/var/lib/grafana