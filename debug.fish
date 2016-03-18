function debug
	uptime
sudo dmesg | tail -20
sar -n DEV 1
sar -n TCP,ETCP 1
htop
end
