function staging --description 'SSH into staging.drchrono.com and run a command'
    if test "$argv"
    	ssh -q squash@104.130.170.86 -t "sudo fish -i -c '$argv'"
    else
        ssh squash@104.130.170.86 -t "sudo fish -i"
    end
end
