#!/bin/bash

set -eux

# make sure the dirs are there

mkdir -p /rc/logs
mkdir -p /rc/tmp
chown -R www-data:www-data /rc

service nginx start
service php5-fpm start

tail -F /var/log/nginx/access.log

