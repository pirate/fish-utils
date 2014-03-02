function sniff
	sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'
end
