function squid.restart
	k squid;launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.squid.plist; launchctl load ~/Library/LaunchAgents/homebrew.mxcl.squid.plist
end
