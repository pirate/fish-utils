function grat
    g
    redis.start
    postgresql.start
    nginx.start
    # celery.start
    runs
end
