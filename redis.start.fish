function redis.start
    echo $green"[+] Starting Redis..."$normal
	psax redis-server | grep -v "fish -c"; and return;
    fork "/usr/local/opt/redis/bin/redis-server /usr/local/etc/redis.conf"
    sleep 1
    psax redis-server | grep -v "fish -c"
end
