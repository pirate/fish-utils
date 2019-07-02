function grat
    g
    cd ..
    supervisord -c etc/supervisor/mac-dev.conf
    g
    pip install -q -r requirements.txt
    manage migrate
    echo $white"[i] Open this in a few seconds: "$blue"https://oddslingers.l"$normal
    echo $green"[+] Starting postgres & redis (logs to data/logs/)..."$normal
    supervisorctl start blitzka-base:
    echo $green"[+] Starting background daemons (logs to data/logs/)..."$normal
    supervisorctl restart blitzka-bg:
    echo $green"[+] Starting django runserver (logs to stdout)..."$normal
    k runserver
    manage runserver
end
