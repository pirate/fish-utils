function gs
	faketty git status $argv 2>&1 | \
    regex 's/^Your branch is up-to-date with /'$green'Up to date with'$normal' /gm' | \
    regex 's/  \(use "git .*$//g' | \
    regex 's/no changes added to commit .*$//g' | \
    regex 's/^\s+$\s*$//gm' | \
    regex 's/nothing to commit//gm' | \
    regex 's/, working tree clean//gm' | \
    regex 's/Changes to be committed:/\n----------------------------------\n'$green'Staged'$normal':/g' | \
    regex 's/Changes not staged for commit:/\n----------------------------------\n'$red'Not staged'$normal':/g' | \
    regex 's/^Untracked files:/\n----------------------------------\n'$cyan'Untracked'$normal':/g' | \
    regex 's/^$//g'
    # echo
end
# nothing to commit -> # $green'Nothing to commit'$normal
