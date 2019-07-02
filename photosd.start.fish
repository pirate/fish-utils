function photosd.start
	sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.photolibraryd
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.cloudphotosd
sudo launchctl load -w /System/Library/LaunchAgents/com.apple.photolibraryd.plist
sudo launchctl load -w /System/Library/LaunchAgents/com.apple.cloudphotosd.plist
end
