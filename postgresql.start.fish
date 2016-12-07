function postgresql.start
    echo "Starting Postgres..."
	psax "/bin/postgres" | grep -v "fish -c"; and return;
    fork "pg_ctl -D /usr/local/var/postgres start"
    sleep 1
    psax "/bin/postgres" | grep -v "fish -c"
end
