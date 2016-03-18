function nginx.start
    echo "Starting Nginx..."
	psax "master process nginx" | grep -v "fish -c"; and return
    sudo fork "nginx -c /usr/local/etc/nginx/nginx.conf"
    sleep 1
    psax "master process nginx" | grep -v "fish -c"
end
