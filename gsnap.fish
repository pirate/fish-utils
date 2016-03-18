function gsnap --description 'g branch -D argv; gru; gch argv'
    switch (count $argv)
    case '1'
        set branch $argv
    case '0'
        if _git_branch_name
            set branch (_git_branch_name)
        else
            echo "No git branch specified or currently checked out."
            exit
        end
    end
    quiet git checkout -b 888_temp
    git branch -D $branch
    echo "That branch sucked anyway..."
    git remote update
    git checkout $branch
    and quiet git branch -D 888_temp; or echo "Aborted due to git throwing a fit."
end
