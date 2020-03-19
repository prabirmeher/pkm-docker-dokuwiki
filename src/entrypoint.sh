#!/bin/bash -e
set -e

# Start php-fpm
mkdir /run/php-fpm && /usr/sbin/php-fpm
# Start Apache
/usr/sbin/httpd -DFOREGROUND