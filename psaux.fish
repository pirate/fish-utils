function psaux
	ps aux | grep -v grep | grep -i "$argv"
end
