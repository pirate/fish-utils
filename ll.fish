function ll
 #    set -x CLICOLOR 1
 #    set -x CLICOLOR_FORCE 1
 #    set -x GREP_COLOR "00;38;5;226"
	# command ls -GOlFah $argv | \
 #    regex 's/.*\.DS_Store.*\n//gm;' | \
 #    regex 's/^(\S+)(\s+\d+\s+)(\w+\s+\w+)(\s+) \-?(\S*)(\s*\S+)([BKMG])(\s+[A-z]+\s+\d+\s+\S+\s+)(.*)$/'$blue'$1'$normal'$2  '$cyan'$3$4 SIZE:$6:SIZEB:$7:ENDSIZEB '$purple'$8  '$normal'$9 '$black'$5'$normal'/g' | \
 #    regex 's/@/'$white'@'$normal'/g' | \
 #    regex 's/SIZE:(\d|.+):SIZEB:(B|K):ENDSIZEB/'$green'$1 $2/g' | \
 #    regex 's/SIZE:(\d|.+):SIZEB:(M):ENDSIZEB/'$yellow'$1 $2/g' | \
 #    regex 's/SIZE:(\d|.+):SIZEB:(G):ENDSIZEB/'$red'$1 $2/g'
    ##         perms  @  mode   user  group size sizeb date  name
    

    if isatty stdout
        set origpath "$PWD"
        set path (greadlink -f -- "$PWD")
        if [ "$argv[1]" != "" ]
            set origpath "$argv[1]"
            set path (greadlink -f -- "$argv[1]")
        end
        if echo "$path" | grep -q ' '
            set path '"'"$path"'"'
        end
        if echo "$origpath" | grep -q ' '
            set origpath '"'"$origpath"'"'
        end
        if [ "$origpath" != "$path" ]
            set path "$origpath $white->$blue $path"
        end

        echo $yellow\> $blue$path$normal
        echo
        # try to recursively get dir sizes with --total-size first, but timeout and show without after 3sec
        timeout 3 exa \
            --group-directories-first \
            --time-style=long-iso \
            --group \
            --modified \
            --icons \
            # --created \
            # --header \
            # --extended \
            --long \
            --git \
            --classify \
            --all \
            --links \
            --mounts \
            --ignore-glob=.DS_Store \
            --total-size \
            -s name \
            $argv
        or exa \
            --group-directories-first \
            --time-style=long-iso \
            --group \
            --modified \
            --icons \
            # --created \
            # --header \
            # --extended \
            --long \
            --git \
            --classify \
            --all \
            --links \
            --mounts \
            --ignore-glob=.DS_Store \
            -s name \
            $argv
    else
        /bin/ls -l
    end
end
