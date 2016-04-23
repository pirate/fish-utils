function dns.clear
	sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
end
