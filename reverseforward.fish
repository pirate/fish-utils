function reverseforward --description 'Use autossh to persistently forward a remote port to a local one.'
    set host "nicksweeting.com"

    switch (count $argv)
    case '3'
        set localport $argv[1]
        set remoteport $argv[2]
        set host $argv[3]
    case '2'
        set localport $argv[1]
        set remoteport $argv[2]
    case '1'
        set localport "$argv"
        set remoteport 6$localport
    case 0
        set localport 22
        set remoteport 666
    case '*'
        echo $red"Invalid arguments"$normal", usage:"
        echo "reverseforward [localport] [remoteport] [host]"
        echo
        echo "Examples:"
        echo $yellow"reverseforward"$normal" (forwards nicksweeting.com:666 to local:22 by default)"
        echo $yellow"reverseforward"$cyan" 80"$normal" (forwards nicksweeting:680 to local:80)"
        echo $yellow"reverseforward"$cyan" 80"$purple" 8080"$green" nicksweeting.com"$normal
        return 1
    end

    quiet "k --all autossh $remoteport"

    echo "[*] Opening autossh tunnel $host:$remoteport -> localhost:$localport..."
    fork "autossh -M 10984 -R $remoteport:localhost:$localport $host -Nv"
    sleep 10
    # check that forwarded TCP port is open on nicksweeting.com
    echo | telnet $host $remoteport 2>&1 | quiet "grep Connection closed by foreign host"
    
    and echo "[√] Started forwarding."
    or tail -f "/Users/squash/tmp/fish_forks/"(pid "/usr/local/bin/fish -c autossh")".log"  # tail the fork log
end
