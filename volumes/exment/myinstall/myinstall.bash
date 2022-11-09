#!/bin/bash

echo "COPY composer.json for my libs"
mv /var/www/exment/composer.json /var/www/exment/composer.json.bak
cp /var/www/exment/tmp/myinstall/composer.json /var/www/exment
composer dump-autoload
