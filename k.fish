function k --description "Systematic genocide of unwanted processes."
    # store k argmuments as query string to search for processes to kill
    set -l query "$argv"

    # if --all flag is specified, remove it from the search query string
    if echo "$argv" | grep -q '\-\-all'
        set query (echo "$query" | perl -p -e 's/--all//g' | xargs)
    end
    
    # First try quietly killing by exact PID or process name
    # awk is to exctract only PID from first column of `ps aux` output
    quiet sudo kill (echo "$query" | awk '{print $1}'); and echo "Killed PID $query";     and return
    quiet sudo killall "$query";                        and echo "Killed Process $query"; and return
    
    # if no exact match is killable, filter process list `ps ax` down to a few results using the given term
    set -l proc (psax "$query")

    # while list of processes != 1
    while test (count $proc) -ne 1
        # if no results, exit immediately
        test (count $proc) = 0; and echo "No processes found."; and return

        if echo "$argv" | grep -q '\-\-all'
            # if --all was passed to the command, kill all processes in the list
            set query 'all'
        else
            # ask if they want to filter further, or kill all processes that matched their search
            echo "Multiple processes found."
            # list the results, with their search term highlighted in color
            for i in $proc; echo "$i" | regex 's/(\s*)(\d+)\s+(.+$)/$1'"$white"'$2'"$normal"' $3/'| cgrep "$query"; end
            read -p 'echo $white"PID"$normal", "$yellow"keyword"$normal", or "$red"all"$normal": "' query
        end

        if test "$query" = "all"
             # if they wanted to kill everything in the list, iterate through it killing each process
            for i in $proc; k (echo "$i" | awk '{print $1}'); end; return
        else
            # otherwise if they wanted to filter further, set proc to the new filtered results and continue looping
            set proc (for i in $proc; echo $i | ggrep -Pio '^\s*((\d*'"$query"'\d*\s)|(\d+\s.*'"$query"')).*$'; end)
        end
    end

    # proc should only hold one line now with pid and command
    # show the single process they want to kill, with their search term color-highlighted
    echo "$proc" | regex 's/(\s*)(\d+)\s+(.+$)/$1'"$white"'$2'"$normal"' $3/' | cgrep "$query"
    set proc (echo $proc | awk '{print $1}')

    # confirm that they want to kill the process, try SIGTERM, then SIGKILL
    set yn (echo \[(tput setaf 1)y(tput sgr0)/(tput setaf 4)n(tput sgr0)\]:)
    read_confirm "Kill? $yn";    or return; and sudo kill    $proc; and echo "[$white√$normal] SIGTERM'ed $proc";    and return
    read_confirm "Kill -9? $yn"; or return; and sudo kill -9 $proc; and echo "[$yellow√$normal] SIGKILL'ed $proc"; and return
end
