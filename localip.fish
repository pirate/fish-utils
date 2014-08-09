function localip
    if test (count $argv) -gt 0
        ipconfig getifaddr $argv
    else
	    ipconfig getifaddr en1; or ipconfig getifaddr en0
    end
end
