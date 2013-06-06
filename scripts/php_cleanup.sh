#!/bin/bash

# Removing these files as these modules are already compiled into php:
rm -f /etc/php.d/bcmath.ini
rm -f /etc/php.d/calendar.ini
rm -f /etc/php.d/mbstring.ini
rm -f /etc/php.d/soap.ini
rm -f /etc/php.d/sockets.ini
rm -f /etc/php.d/uploadprogress.ini
rm -f /etc/php.d/wddx.ini
rm -f /etc/php.d/zip.ini

exit 0
