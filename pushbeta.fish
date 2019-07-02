function pushbeta
	set branch (_git_branch_name)
gdel beta; gch -b beta; gpush
ssh -t blitzka-beta blitzka-server deploy beta
gch $branch
end
