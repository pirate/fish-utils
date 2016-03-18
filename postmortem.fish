function postmortem --description 'look at all the commits between $1 and HEAD in dir $2 (django_root by default)'
    set -l date "$argv[1]"
    set -l DIR $DJANGO_ROOT
    echo $blue"Commits between "$green$date$blue" and "$green(date "+%Y-%m-%d")$blue" on "$red(_git_branch_name)$blue" in "$green$DIR$blue":"$normal
    git log --pretty=oneline  --after "$date 00:00:00" -- "$DIR" | cat
    for n in (git log --pretty=oneline  --after "$date 00:00:00" -- "$DIR")
        set -l commit (echo $n | awk '{print $1}');
        git show $commit
    end
end
