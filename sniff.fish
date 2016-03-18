function sniff
	bash -c "sudo ngrep -d '$argv' -t '^(GET|POST) ' 'tcp and port 80'"
end
