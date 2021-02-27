#!bin/sh

# Setup MySQL (init datadir and make system table)
mkdir -p /run/mysqld
mysql_install_db

# Start mysql daemon
/usr/bin/mysqld