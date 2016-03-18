function mysql.stop
	for p in (pid "mysqld --user=root")
        k $p
    end
end
