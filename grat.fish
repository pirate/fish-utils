function grat
    g
    redis.start
    postgresql.start
    nginx.start
    # celery.start
    echo "Remember to start watchify if you want JS compiling"
    runs
end
