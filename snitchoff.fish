function snitchoff
	sudo launchctl unload /Library/LaunchAgents/at.obdev.LittleSnitchUIAgent.plist
sudo launchctl unload /Library/LaunchDaemons/at.obdev.littlesnitchd.plist
k "Little Snitch" --all
end
