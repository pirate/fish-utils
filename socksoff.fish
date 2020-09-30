function socksoff -a iface --description "Disable the socks proxy on a given [iface]"
    test -n "$iface"; or set iface (active_interface)
    set iface_name (networksetup -listallhardwareports | grep "$iface" -B 1 | head -n 1 | awk '{print $3}')

    echo $red"[X] Shutting down socks proxy on $iface..."$normal
    echo ""
    echo $yellow"[*] Stopping SSH tunnel process..."$normal
    k "ssh -N -n -g -D"
    echo "    √ Stopped SSH tunnel process."

    echo $yellow"[*] Removing SOCKS proxy settings from $iface ($iface_name) interface..."$normal
    sudo networksetup -setsocksfirewallproxystate "$iface_name" off
    echo "    √ Set SOCKS proxy state to disabled"
    
    echo ""
    echo $green"[√] Stopped socks proxy on $iface."$normal
end
