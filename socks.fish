function socks
    quiet tcping -t 2 nicksweeting.com 80
    and echo "[√] Able to reach nicksweeting.com:80"
    or begin
        echo "[X] Unable to reach nicksweeting.com:80"
        tcping -t 2 nicksweeting.com 80
        return
    end

    echo "[*] Changing network settings for Wi-Fi and Ethernet"
    sudo networksetup -setsocksfirewallproxystate Wi-Fi on
    quiet sudo networksetup -setsocksfirewallproxystate Ethernet on

    echo "[+] Starting socks proxy on port 1080."
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
