function socksoff
	sudo networksetup -setsocksfirewallproxystate Wi-Fi off
    quiet sudo networksetup -setsocksfirewallproxystate Ethernet off
    k "ssh -N -n -g -D 1080"
    echo "[X] Socks proxy stopped."
end
