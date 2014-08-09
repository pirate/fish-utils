function suFinder --description "Open Finder as root"
    killall Finder
	sudo /System/Library/CoreServices/Finder.app/Contents/MacOS/Finder $argv
    open /Applications/TotalFinder.app
end
