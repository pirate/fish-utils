function gdel
    if test "$argv"
        set branch "$argv"
    else
        set branch (_git_branch_name)
    end
    if test $branch = (_git_branch_name)
        git checkout dev
    end
	g branch -D $branch
end
autocomplete "gdel" "(git branch -q | regex 's/ |\* //g')" "Branch"
