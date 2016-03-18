function redis.stop
    for p in (pid redis-server)
	   k $p
    end 
end
