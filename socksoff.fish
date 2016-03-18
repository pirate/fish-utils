function socksoff
	sudo networksetup -setsocksfirewallproxystate Wi-Fi off
    sudo networksetup -setsocksfirewallproxystate Ethernet off
end
