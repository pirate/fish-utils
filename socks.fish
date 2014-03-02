function socks
	set port 1080
echo "[+] Starting socks proxy on port $port."
ssh -v -N -n -g -D 1080 nick@nicksweeting.com; and echo "[+] Socks proxy exited."
end
