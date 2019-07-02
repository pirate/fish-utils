function _git_branch_name --description 'get current git branch name'
    git branch | grep \* | cut -d ' ' -f2
end
