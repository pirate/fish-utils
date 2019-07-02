function portscan
	nmap -p 1-65535 -T4 -A -v $argv
end
