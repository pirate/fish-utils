function gbs --description 'Git branch set upstream origin to current'
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

    git branch --set-upstream-to=origin/$branch $branch
end
