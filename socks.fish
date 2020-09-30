function socks --description "Create a SOCKS proxy on 127.0.0.1:1080 to a [target] [port]"
    set localhost "127.0.0.1"
    set localport "1080"
    set iface (active_interface)
    test -n "$argv"; or set argv grape.zalad.io -p 44

    set host grape.zalad.io
    set port 44
    
    echo $green"[+] Setting up socks proxy on $iface: $localhost:$localport->$host:$port."$normal
    echo ""
    
    isportopen "$host" "$port"; or return 1
    
    sockson "$localhost" "$localport" "$iface"
    
    echo $yellow"[*] Starting SSH tunnel process..."$normal
    echo "    √ Started ssh tunnel (press Ctrl+C to close the tunnel when finished)"
    ssh -N -n -g -D "1080" "grape"
    echo ""
    echo ""
    socksoff "$iface"
end
