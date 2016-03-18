function k --description "Systematic genocide of unwanted processes."
    set -l query "$argv"
    if echo "$argv" | grep -q '\-\-all'
        set query (echo "$query" | perl -p -e 's/--all//g' | xargs)
    end
    quiet kill (echo "$query" | awk '{print $1}'); or quiet killall "$query"; and echo "Killed"; and return
    set -l proc (psax "$query")

    while test (count $proc) -ne 1
        test (count $proc) = 0; and echo "No process found."; and return
        if echo "$argv" | grep -q '\-\-all'
            set query 'all'
        else
            echo "Multiple processes found."
            for i in $proc
                echo "$i" | cgrep "$query"
            end
            read -p "echo PID, keyword, or 'all': " query
        end
        if test "$query" = "all"
            for i in $proc; k "$i"; end; return
        else
            set proc (for i in $proc; echo $i | ggrep -Pio '^\s*((\d*'"$query"'\d*\s)|(\d+\s.*'"$query"')).*$'; end)
        end
    end

    echo "$proc" | cgrep "$query"
    # proc should only hold one line now with pid and command
    set yn (echo \[(tput setaf 1)y(tput sgr0)/(tput setaf 4)n(tput sgr0)\]:)
    read_confirm "Kill? $yn";         or return; and sudo kill                 (echo $proc | awk '{print $1}'); and echo "Killed";         and return
    read_confirm "Kill -9? $yn";      or return; and sudo kill -9              (echo $proc | awk '{print $1}'); and echo "Killed -9";      and return

    set -e proc; set -e query;
end
