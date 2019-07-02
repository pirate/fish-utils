function lookup
	echo -e "\n[i] Local hostname table lookup for $argv"
    host $argv

    echo -e "\n[i] NSLookup for $argv"
    nslookup $argv

    echo -e "\n[i] Routing table lookup for $argv"
    route -v get $argv
    
    echo -e "\n[i] ARP table lookup for $argv"
    s arp -x $argv

    echo -e "\n[i] Ping to $argv with routing info"
    ping -R -v -c1 $argv

    echo -e "\n[i] Traceroute to $argv with routing info"
    mtr -r -c1 $argv

    echo -e "\n[i] OS detection of $argv"
    s nmap -O $argv

    echo -e "\n[i] Full nmap scan of $argv"
    s nmap -A $argv

    # echo -e "\n[i] OpenSSL certificate info for $argv"
    # openssl s_client -connect $argv:443
end
