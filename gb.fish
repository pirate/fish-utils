function gb
    switch (count $argv)
    case 0
        # color branch name, head, and commit msg
        # color [ahead 3] in yellow
        # makr current branch in red
        git branch -v | \
            regex 's/^(\*?\s+.+?\s+)(\w+)(.*)$/'$blue' $1'$white' ['$green'$2'$white'] $3'$normal'/gm' | \
            regex 's/(\[FOCS-\w+\])/'$black'$1'$normal'/gm' | \
            regex 's/(\[ahead \w+\])/'$green'$1'$normal'/gm' | \
            regex 's/(\[behind \w+\])/'$yellow'$1'$normal'/gm' | \
            regex 's/(\[ahead \w+, behind \w+\])/'$red'$1'$normal'/gm' | \
            regex 's/\* (\w+)/'$red'⎇ $1/gm'
    case '*'
        git branch $argv
    end
end
