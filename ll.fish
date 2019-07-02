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
    exa --group-directories-first -lagF --git --time-style=long-iso $argv
end
