function sniff
    bash -c "sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
end
