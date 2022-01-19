#!/bin/bash
set -e

# if [[ -f "/var/www/composer.json" ]] ;
# then
#     cd /var/www
#     if [[ -d "/var/www/vendor" ]] ;
#     then
#         echo "Composer optimize autoloader"
#         composer update --prefer-dist --no-interaction --optimize-autoloader --no-dev
#         echo "Laravel - Clear All [Development]"
#         php artisan view:clear
#         php artisan route:clear
#         php artisan config:clear
#         php artisan clear-compiled
#         chmod -R 777 /var/www/storage
#     else
#         echo "Composer vendor folder was not installed. Running $> composer install --prefer-dist --no-interaction --optimize-autoloader --no-dev"
#         composer install --prefer-dist --no-interaction --optimize-autoloader --no-dev
#         echo "Laravel - Clear All [Development]"
#         php artisan view:clear
#         php artisan route:clear
#         php artisan config:clear
#         php artisan clear-compiled
#         chmod -R 777 /var/www/storage
#     fi

# fi

#     if [[ "$(ls -A "/var/www/")" ]] ;
#     then
#         echo "Directory is not Empty, Please deleted hiden file and directory"
#     else
#         rsync -av /app/akaunting/* /var/www/
#         composer install
#         echo "Laravel - Clear All [Development]"
#         php artisan view:clear
#         php artisan route:clear
#         php artisan config:clear
#         php artisan clear-compiled
#         chmod -R 777 /var/www/storage
#     fi
# echo "Application Enverment veriable check"
# if [[ ! -f ".env" ]] ;
# then
#     echo ".env file not found"
#     cp /app/akaunting/.env /var/www/.env
# else
#     echo ".env file exit"
# fi
echo "Application key set ...."
# php artisan key:generate
cp /app/default.conf /etc/nginx/conf.d/default.conf
# rm -rf /var/preview
nginx -s reload

chmod -R 777 /var/www/storage
chmod 777 /var/www/.env
echo "App is ready for use"
exec "$@"