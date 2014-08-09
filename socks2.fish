function socks2
	ssh drstaff "nohup ssh -N -D 9697 pfserver > /dev/null 2> /dev/null < /dev/null & echo "REMOTE FWD ON"; exit"
    nohup ssh -N -L 1080:localhost:9697 drstaff > /dev/null 2> /dev/null < /dev/null &
    echo "LOCAL FWD ON"
    sudo networksetup -setsocksfirewallproxystate Wi-Fi on
    sudo networksetup -setsocksfirewallproxystate Ethernet on
    echo "SOCKS ON"
    ssh drstaff -t "ssh -t pfserver \"cd drchrono-web && bash\""
end
