function current_city
    set pubip (ip)
	set geoip (geoiplookup "$pubip")
    set city (echo "$geoip" | tail -1 | regex 's/.*?: .*?, .., .*?, //g' | regex 's/, .*$//g' | replace 'GeoIP City Edition' '')
    set country (echo "$geoip" | head -1 | regex 's/.*Country Edition: (.+?), .+$/$1/gm')
    echo "$city, $country"
end
