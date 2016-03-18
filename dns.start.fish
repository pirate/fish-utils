function dns.start
    echo "Starting DNSMasq..."
	psax dnsmasq | grep -v "fish -c"; and return
    sudo fork "/usr/local/opt/dnsmasq/sbin/dnsmasq"
    sleep 1
    psax dnsmasq | grep -v "fish -c"
end
