#!bin/sh

# SSL
openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 -subj "/C=JP/ST=TOkyo/L=Minato-City/O=42Tokyo/OU=./CN=localhost" -keyout /etc/ssl/private/services.key -out /etc/ssl/certs/services.crt
sed -i -e "s|protocol = http|protocol = https|g" /var/lib/grafana/conf/defaults.ini
sed -i -e "s|cert_file =|cert_file = /etc/ssl/certs/services.crt|g" /var/lib/grafana/conf/defaults.ini
sed -i -e "s|cert_key =|cert_key = /etc/ssl/private/services.key|g" /var/lib/grafana/conf/defaults.ini

# Start telegraf
telegraf &

# Start SSH
/usr/sbin/sshd

# Start grafana
/var/lib/grafana/bin/grafana-server --homepath=/var/lib/grafana