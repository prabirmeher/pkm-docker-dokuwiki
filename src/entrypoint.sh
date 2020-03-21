#!/bin/bash -e
set -e

# Start php-fpm
if [ ! -d /run/php-fpm ]; then
	mkdir /run/php-fpm
fi
/usr/sbin/php-fpm

# Start Apache
/usr/sbin/httpd -DFOREGROUND
