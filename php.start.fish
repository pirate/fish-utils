function php.start
    echo "Starting PHP-FPM..."
	psax php-fpm | grep -v "fish -c"; and return;
    fork "php-fpm --fpm-config /usr/local/etc/php/5.5/php-fpm.conf"
    sleep 1
    psax php-fpm | grep -v "fish -c"
end
