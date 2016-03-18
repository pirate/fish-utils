function psaux
	ps aux | grep -v grep | cgrep -i "$argv"
end
