function squid.start
    echo "Starting Squid..."
	psax squid; and return;
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.squid.plist
    sleep 1
    psax squid
end
