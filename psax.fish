function psax
	ps ax -o pid,command | grep -v grep | grep -i "$argv"
end
