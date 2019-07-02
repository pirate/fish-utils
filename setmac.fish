function setmac --description 'Set the interface [en0] ethernet address to [mac:address:here]'
    switch (count $argv)
    case '2'
        set iface "$argv[1]"
        set mac "$argv[2]"
    case '1'
        set iface "en0"
        set mac "$argv[1]"
    case 0
        set iface "en0"
        set mac (openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
    end
    echo $yellow"[*] Setting interface "$blue$iface$yellow" MAC address to: "$blue$mac$normal
    if sudo ifconfig "$iface" ether "$mac"
        echo $green"[√] Set succesfully."$normal
        ifconfig "$iface"
    else
        echo $red"[X] Failed to set "$blue$iface$normal" MAC address!"$normal
        return 1
    end
end
