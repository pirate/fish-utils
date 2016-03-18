function postgresql.stop
	launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
k --all postgresql
end
