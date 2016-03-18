function mysql.start
    echo "Starting MySQL..."
	psax mysqld | grep -v "fish -c"; and return;
    sudo fork "mysqld --user=root --bind-address=0.0.0.0"
    sleep 1
    psax mysqld | grep -v "fish -c"
end
