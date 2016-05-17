function find_file --description "Find [file] in [directory]"
    # collect arguments
    set -l query $argv[1]
    set -l folder "."
    test (count $argv) -gt 1; and set folder "$argv[2]"

    # search current folder for file
    set -l CLICOLOR 0
    set results (/bin/ls "$folder" | grep -i "$query")
    if not test "$results"
        return 1
        # uncomment to change file not found behavior to list dir instead of exiting 1 immediately
        # set results (/bin/ls)
    end

    # if multiple files found, query user for choice (using stderr)
    while test (count $results) -gt 1
        for line in $results
            echo "$line" | cgrep $query 1>&2; or echo "$line" 1>&2
        end
        read -p 'echo $yellow"Pick file: "$normal' query
        set results (for app in $results;
                        echo "$app" | ggrep -i "$query";
                     end)
    end

    # send result to stdout or exit 1
    not test $results; and return 1
    echo "$results"
end
