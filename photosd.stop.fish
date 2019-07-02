function photosd.stop
	sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.photolibraryd
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.cloudphotosd
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.photolibraryd.plist
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.cloudphotosd.plist
end
