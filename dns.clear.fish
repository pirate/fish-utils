function dns.clear
    sudo arp -a -d
    sudo killall -HUP mDNSResponder
    osascript /Users/squash/bin/chrome-dns-clear.applescript
end
