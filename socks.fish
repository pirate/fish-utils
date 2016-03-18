function socks
    echo "[+] Starting socks proxy on port 1080."
    sudo networksetup -setsocksfirewallproxystate Wi-Fi on
    sudo networksetup -setsocksfirewallproxystate Ethernet on
    switch (count $argv)
    case '1'
        ssh -N -n -g -D 1080 nick@$argv; and echo "[+] Socks proxy exited."
    case 0
        ssh -N -n -g -D 1080 nick@nicksweeting.com; and echo "[+] Socks proxy exited."
    case '*'
        ssh -N -n -g -D 1080 $argv; and echo "[+] Socks proxy exited."
    end
end
