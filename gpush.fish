function gpush
	git push --set-upstream origin (_git_branch_name) $argv 2>&1 | \
    regex 's/Everything up-to-date\n/'$green'Everything up-to-date'$normal'/gm' | \
    regex 's/Branch .+ set up to track remote branch .*//g' | \
    regex 's/\.\./'$green'..'$normal'/g' | \
    regex 's/-\>/'$green'->'$normal'/g'
    blink 1
end
