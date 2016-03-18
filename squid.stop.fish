function squid.stop
	quiet launchctl unload ~/Library/LaunchAgents/*.squid.plist
    k squid
end
