function watchify.start
    echo "Starting Watchify..."
    g
    psax watchify | grep -v "fish -c"; and return
    watchify src/pages/home.js -o static/src/pages/home.js
end
