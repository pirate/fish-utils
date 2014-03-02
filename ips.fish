function ips
	ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'
end
