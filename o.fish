function o
    if test (count $argv) -gt 0
	    open $argv
    else
        open .
    end
end
