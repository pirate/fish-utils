function php.stop
    quiet launchctl unload /Users/nick/Library/LaunchAgents/*.php*.plist
	k --all php-fpm
end
