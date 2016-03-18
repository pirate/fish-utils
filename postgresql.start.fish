function postgresql.start
	/usr/local/opt/postgresql/bin/postgres -D /usr/local/var/postgres -r /usr/local/var/postgres/server.log &
end
