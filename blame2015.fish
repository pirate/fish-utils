function blame2015
	for l in (ack -l $argv | grep '\.py')
        git blame $l | grep 2015
    end
end
