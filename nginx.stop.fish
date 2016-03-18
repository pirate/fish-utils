function nginx.stop
	for p in (pid "master process nginx")
        k $p
    end
end
