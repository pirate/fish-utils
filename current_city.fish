function current_city
	geoiplookup (ip) | tail -1 | regex 's/.*?: .*?, .., .*?, //g' | regex 's/, .*$//g'
end
