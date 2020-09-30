function current_city
	set geoip (geoiplookup (ip))
    set country (echo "$geoip" | grep "Country Edition")
    set city (echo "$geoip" | grep "City Edition")
    set country_code (echo "$geoip" | head -1 | perl -pe 's/^GeoIP Country Edition: (?<country_code>.+?), (?<country>.+?)$/$+{country_code}/')
    set city_name (echo "$geoip" | tail -1 | geoiplookup (ip) | tail -1 | perl -pe 's/^GeoIP City Edition, (?<rev>.+): (?<cc>.+), (?<state_code>.+), (?<state>.+), (?<city>.+), (?<zip>.+), (?<lat>.+), (?<lng>.+), .+, .+$/$+{city}/')
    echo (echo "$city_name" | replace 'N/A' 'Unknown'), (echo "$country_code" | replace 'N/A' 'Unknown')
end
