function all.stop
	dns.stop
    mysql.stop
    postgresql.stop
    nginx.stop
    php.stop
    celery.stop
    squid.stop
    tornado.stop
    redis.stop
    mongo.stop
    # bonjour.stop
end
