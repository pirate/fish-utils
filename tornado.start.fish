function tornado.start
    if test "$argv" = "restart"
        sleep 2
    end
    k 'tornadoapp'
    echo "Starting Tornado..."
    python -m focsui.tornadoapp $argv
    or tornado.start restart
end
