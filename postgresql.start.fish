function postgresql.start
    echo "Starting Postgres..."
	psax "/usr/local/bin/postgres" | grep -v "fish -c"; and return;
    fork "/usr/local/bin/postgres -D /usr/local/var/postgres -r /usr/local/var/postgres/server.log"
    sleep 1
    psax "/usr/local/bin/postgres" | grep -v "fish -c"
end
