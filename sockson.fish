function sockson -a host -a port -a iface "Enable a [host]:[port] socks proxy on [iface]"
	test -n "$host"; or set host "127.0.0.1"
    test -n "$port"; or set port "1080"
    test -n "$iface"; or set iface (active_interface)
    set iface_name (networksetup -listallhardwareports | grep $iface -B 1 | head -n 1 | awk '{print $3}')

    echo $yellow"[+] Adding SOCKS proxy settings on $iface ($iface_name) interface..."$normal
    sudo networksetup -setsocksfirewallproxy "$iface_name" "$host" "$port"
    echo "    √ Set SOCKS proxy on $iface_name to $host:$port"
    sudo networksetup -setsocksfirewallproxystate "$iface_name" on
    echo "    √ Set SOCKS proxy state to enabled"
end
