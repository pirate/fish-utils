function socks
    echo "[+] Starting socks proxy on port 1080."
    sudo networksetup -setsocksfirewallproxystate Wi-Fi on
    quiet sudo networksetup -setsocksfirewallproxystate Ethernet on
    switch (count $argv)
    case '1'
        ssh -N -n -g -D 1080 nick@$argv
    case 0
        ssh -N -n -g -D 1080 nick@nicksweeting.com
    case '*'
        ssh -N -n -g -D 1080 $argv
    end
    socksoff
end
