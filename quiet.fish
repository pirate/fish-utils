function quiet
	eval "$argv 2>&1 > /dev/null" 2>&1 > /dev/null; and return 0; or return 1
end
