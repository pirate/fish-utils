function watchify.start
    echo "Starting Watchify..."
    g
    psax watchify | grep -v "fish -c"; and return
    watchify src/home.js -o static/src/home.js
end
