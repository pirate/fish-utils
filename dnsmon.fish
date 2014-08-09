function dnsmon
	while true :
        dig $argv +short > ~/.lastdig
        sleep 2
        dig $argv +short > ~/.lastdig2
        colordiff ~/.lastdig ~/.lastdig2
        end
end
