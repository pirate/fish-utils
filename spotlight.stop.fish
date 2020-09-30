function spotlight.stop
	sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
    sudo mdutil -a -i off
end
