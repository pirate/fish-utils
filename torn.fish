function torn
    cd ~/focsui
    postgresql.start
    dns.start
    redis.start
    nginx.start
    # echo "Starting Watchify..."
    # psax watchify | grep -v "fish -c"; and return
    # watchify src/main/FlightBuilder/main.js -o static/src/main/FlightBuilder/main.js &
    tornado.start $argv
end
