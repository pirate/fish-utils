function dnsmon
	while true :
        dig $argv +short > ~/.lastdig
        sleep 2
        dig $argv +short > ~/.lastdig2
        cat ~/.lastdig2 | xargs
        colordiff ~/.lastdig ~/.lastdig2
        end
end
