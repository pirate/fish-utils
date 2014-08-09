function quiet
	eval "$argv 2>&1 > /dev/null" 2>&1 > /dev/null
end
