function gpush
	git push --set-upstream origin (_git_branch_name) $argv 2>&1 | regex 's/Everything up-to-date/'$green'Everything up-to-date'$normal'/g'
end
