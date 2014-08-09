function psaux
	ps aux | grep -v grep | grep "$argv"
end
