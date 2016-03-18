function socks
    echo "[+] Starting socks proxy on port 1080."
    sudo networksetup -setsocksfirewallproxystate Wi-Fi on
    sudo networksetup -setsocksfirewallproxystate Ethernet on
    ssh -v -N -n -g -D 1080 nick@nicksweeting.com; and echo "[+] Socks proxy exited."
end
