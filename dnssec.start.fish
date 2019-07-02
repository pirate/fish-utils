function dnssec.start
    echo $green"[+] Starting HTTPS DNS proxy on 127.0.0.1:53 to 1.1.1.1..."$normal
    networksetup -setdnsservers Wi-fi '127.0.0.1'
    psax cloudflared | grep -v "fish -c"; and return
    fork "sudo cloudflared proxy-dns"
end
