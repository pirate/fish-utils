function ping_speed --description 'description'
    set -l server '8.8.8.8'
    set -l count 1

    switch (count $argv)
    case '2'
        set count $argv[2]
        set server $argv[1]
    case '1'
        set server $argv[1]
    end
    ping -c $count -t 1 $server | tail -1 | regex 's/^(.* = \d*\.\d*\/)(\d*)(.\d*\/.*)$/$2 ms/gm'
end
