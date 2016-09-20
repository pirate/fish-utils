function gcom
	git commit --allow-empty -m "$argv" | \
    regex 's/\.\./'$green'../g' | \
    regex 's/-\>/'$green'->/g'
end
