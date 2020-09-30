function spotlight.start
	sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
    sudo mdutil -a -i on
end
