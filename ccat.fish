function ccat
	if count $argv >/dev/null
		pygmentize -g < $argv
	else
		pygmentize -g
	end
end
