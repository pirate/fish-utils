function dns.stop
	sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
    k --all dnsmasq
end
