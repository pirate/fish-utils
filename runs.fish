function runs
	mysql.start
    redis.start
    dns.start
    nginx.start
    celery.start
    while true
        django.start $argv
        echo "Restarting django in 2sec..."
        sleep 2
    end
end
