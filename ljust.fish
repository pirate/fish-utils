function ljust
	xargs -E '\n' -I {} printf "%-$argv[1]s" "{}"
end
