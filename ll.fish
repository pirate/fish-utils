# Pretty Colors
set cyan (set_color -o cyan)
set green (set_color -o green)
set yellow (set_color -o yellow)
set purple (set_color -o magenta)
set red (set_color -o red)
set blue (set_color -o blue)
set black (set_color -o black)
set white (set_color -o white)
set normal (set_color normal)
set arrow "➜ "

set -x CLICOLOR 1
set -x CLICOLOR_FORCE 1
set -x GREP_COLOR "00;38;5;226"

function ll
	command ls -GOlFah $argv | \
    regex 's/^(\S+)(\s+\d+\s+)(\w+\s+\w+)(\s+) \-?(\S*)(\s*\S+)([BKMG])(\s+[A-z]+\s+\d+\s+\S+\s+)(.*)$/'$blue'$1'$normal'$2  '$cyan'$3$4 SIZE:$6:SIZEB:$7:ENDSIZEB '$purple'$8  '$normal'$9 '$black'$5'$normal'/g' | \
    regex 's/@/'$white'@'$normal'/g' | \
    regex 's/SIZE:(\d|.+):SIZEB:(B|K):ENDSIZEB/'$green'$1 $2/g' | \
    regex 's/SIZE:(\d|.+):SIZEB:(M):ENDSIZEB/'$yellow'$1 $2/g' | \
    regex 's/SIZE:(\d|.+):SIZEB:(G):ENDSIZEB/'$red'$1 $2/g'
    ##         perms  @  mode   user  group size sizeb date  name
end
