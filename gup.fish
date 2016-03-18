function gup --description "Git rebase on top of dev then push."
    if not _git_branch_name
        echo "Not on a git branch."
        return
    end
    
    switch (count $argv)
    case '1'
        set target $argv
    case '0'
        set target 'dev'
    end
    set branch (_git_branch_name)
    gch $target; or return;
    gp; or return;
    gch $branch; or return;
    git rebase $target; or return;
    and gpush; or echo $red"["$yellow"X"$red"] The rebase changed history, to proceed, run "$normal"`gpush -f`"$red" manually"$normal
end
