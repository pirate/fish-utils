function psax
	ps ax -o pid,command | grep -v grep | grep --color=always -i "$argv"
end
