function nginx_listener
    while true
        if tail -1 /usr/local/var/log/nginx/access.log | grep '/start_runserver'
            if not psaux runserver
                tab "grat --nowatch"
                sleep 2
                osascript -e "
                    tell application \"Google Chrome\"
                        activate
                    end tell"
            end
            sleep 2
        else
            sleep 1
        end
    end
end


function runserver_autostarter --description 'Listen for nginx events and automatically start runserver'
    psaux 'runserver'; and exit 0
    psaux 'nginx_listener'; and exit 0
    fork nginx_listener
    echo "[i] Started listening for nginx triggers at /start_runserver"
end
