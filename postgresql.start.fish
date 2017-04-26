function postgresql.start
    echo $green"[+] Starting Postgres..."$normal
	psax "/bin/postgres" | grep -v "fish -c"; and return;
    fork "pg_ctl -D /usr/local/var/postgres start"
    sleep 1
    psax "/bin/postgres" | grep -v "fish -c"
end
