function ll2
    command ls -GlFah $argv | \
    regex 's/^(\S+)(\s+\d+\s+)([a-z]+\s+[a-z]+)(\s+)(\S+?)([A-Z])(\s+[A-z]+\s+\d+\s+\S+\s+)(.*)$/'$blue'$1'$normal'$2  '$cyan'$3$4 '$red'$5'$white'$6  '$purple'$7  '$normal'$8/g' | \
    regex 's/@/'$white'@'$normal'/g' | \
    regex 's/SIZE:(\d|.+):SIZEB:(B|K):ENDSIZEB/'$green'$1 $2/g' | \
    regex 's/SIZE:(\d|.+):SIZEB:(M):ENDSIZEB/'$yellow'$1 $2/g' | \
    regex 's/SIZE:(\d|.+):SIZEB:(G):ENDSIZEB/'$red'$1 $2/g'
end
