function find_file --description "Find [file] in [directory]"
    set -l folder "."
    test (count $argv) -gt 1; and set folder "$argv[2]"
    set -l query $argv[1]
    set -l CLICOLOR 0
    set results (/bin/ls "$folder" | grep -i "$query")
    if not test $results
        set results (/bin/ls )
    while test (count $results) -gt 1
        for line in $results
            echo "$line" | cgrep $query 1>&2
        end
        read -p 'echo $yellow"Pick file: "$normal' query
        set results (for app in $results; echo $app | ggrep -i "$query"; end)
    end
    not test $results; and return 1
    echo "$results"
end
