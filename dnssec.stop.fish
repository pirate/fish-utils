function dnssec.stop
	k --all cloudflared
networksetup -setdnsservers Wi-fi '1.1.1.1'
end
