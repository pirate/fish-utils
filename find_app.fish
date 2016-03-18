function find_app
    set -l query $argv
    set -l CLICOLOR 0
    set results (/bin/ls /Applications/ | grep -i "$query")
    while test (count $results) -gt 1
        for line in $results
            echo "$line" | cgrep $query 1>&2
        end
        read -p 'echo $yellow"Pick app: "$normal' query
        set results (for app in $results; echo $app | ggrep -i "$query"; end)
    end
    not test $results; and return 1
    echo "/Applications/$results"
end
