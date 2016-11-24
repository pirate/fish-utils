function service --description 'Manage startup items on mac, emulates ubuntu service command'
	set tmpfile ~/tmp/services.txt

    quiet mkdir -p ~/tmp/
    set -u CLICOLOR_FORCE
    command ls /Users/nick/Library/LaunchAgents/*.plist > $tmpfile
    command ls /Library/LaunchAgents/*.plist >> $tmpfile
    command ls -R /Library/StartupItems | grep "*.plist" >> $tmpfile
    command ls /Library/LaunchDaemons/*.plist >> $tmpfile
    # command ls /System/Library/LaunchAgents/*.plist >> $tmpfile
    # command ls /System/Library/LaunchDaemons/*.plist >> $tmpfile
    find /Library/StartupItems -iwholename "*.plist" >> $tmpfile
    loginitems >> $tmpfile

    switch (count $argv)
        case 0
            cat $tmpfile
        case 1
            set service (grep -i "$argv[1]" < $tmpfile)
            if test "$service"
                grep -i "$argv[1]" < $tmpfile | cgrep "$argv[1]"
                return 0
            else
                echo $red"[X] Service $argv[1] not found"$normal >&2
                return 1
            end
        case 2
            set service (grep -i "$argv[1]" < $tmpfile)
            set query "$argv[1]"
            set action "$argv[2]"

            # while list of services != 1
            while test (count $service) -ne 1
                # if no results, exit immediately
                if test (count $service) = 0
                    echo $red"[X] Service $argv[1] not found"$normal >&2
                    return 1
                end

                if echo "$argv" | grep -q '\-\-all'
                    # if --all was passed to the command, kill all services in the list
                    set query 'all'
                else
                    # ask if they want to filter further, or kill all services that matched their search
                    echo $yellow"Multiple services found:"$normal >&2
                    # list the results, with their search term highlighted in color
                    for i in $service;
                        echo "$i" | regex 's/(\s*)(\d+)\s+(.+$)/$1'"$white"'$2'"$normal"' $3/'| cgrep "$query";
                    end
                    read -p 'echo $yellow"keyword"$normal, or $red"all"$normal: ' query
                end
                if test "$query" = "all"
                     # if they wanted to do something to everything in the list, iterate through each running the service command
                    for i in $service
                        service "$i" "$action"
                    end
                    sleep 1
                    psaux "$argv[1]"
                    return 0
                else
                    # otherwise if they wanted to filter further, set proc to the new filtered results and continue looping
                    set service (for i in $service; echo $i | grep -i "$query"; end)
                end
            end

            switch "$action"
                case 'start'
                    echo $green"[+] Starting $service..."$normal >&2
                    if echo "$service" | quiet grep '\.app'
                        open -a "$service"
                    else
                        launchctl load "$service"
                        or sudo launchctl load "$service"
                    end
                    sleep 1
                    psaux "$argv[1]"

                case 'stop'
                    echo $red"[X] Unloading and killing $service..."$normal >&2
                    quiet launchctl unload "$service"
                    or sudo quiet launchctl unload "$service"
                    sleep 1
                    k "$service"
                    or k "$argv[1]"
                    or k "$query"

                case 'kill'
                    echo $red"[X] Killing $service..."$normal >&2
                    k "$service"
                    or k "$argv[1]"

                case 'delete'
                    echo $red"[X] Deleting $service..."$normal >&2
                    launchctl -w unload "$service"
                    or sudo launchctl -w unload "$service"
                    sleep 1
                    k "$service"
                    mv "$service" ~/.Trash/"$service"

                case 'status'
                    echo $cyan"[i] Status $service..."$normal >&2
                    set short_service (echo "$service" | regex 's/^\/.*\/(.*).plist$/$1/g')
                    sudo launchctl list | grep "$short_service"
                    psaux "$argv[1]"
                    or psaux "$query"
            end
        case '*'
            grep -v "/System/Library" $tmpfile
    end

    # echo "Which one?"
    #     echo ">"(grep -q "$argv[1]" ~/.services)
    #     read -l -p "[#]: " confirm
    #     echo $srv[confirm]

    # ; and echo "Service: "(grep "$argv[1]" ~/.services); or ps aux | grep -v grep | grep $argv[1]; or echo "Service "$argv[1]" not found"
    # if test (count $argv) -gt 1
    #     switch $argv[1]
    #     case 'start'
    #         if test (count $argv) -gt 1
    #             set cmd "command sudo $history[1] $argv[2..-1]"
    #         else
    #             set cmd "command sudo $history[1]"
    #         end
    #         eval $cmd
    #     case 'stop'
    #         set cmd "command sudo "$argv[1]
    #         eval $cmd
    #     case 'restart'
    #         set cmd "command sudo $argv"
    #         eval $cmd
    #     case '*'
    #         set cmd "command sudo $argv"
    #         eval $cmd
    #     end
    # else
    #     echo hi
    # end
end
