function highlight
	for i in "$argv[1]"; echo "$i" | regex 's/(\s*)(\d+)\s+(.+$)/$1'"$white"'$2'"$normal"' $3/'| cgrep "$argv[2]"; end
end
