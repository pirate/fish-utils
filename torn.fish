function torn
    cd ~/focsui
    dns.start
    nginx.start
    postgresql.start
    redis.start
    celery.start
    # echo "Starting Watchify..."
    # psax watchify | grep -v "fish -c"; and return
    # watchify src/main/FlightBuilder/main.js -o static/src/main/FlightBuilder/main.js &
    tornado.start $argv
end
