function postgresql.stop
	quiet launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
    k --all postgresql
end
