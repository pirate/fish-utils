function mongo.start
    echo "Starting MongoDB..."
	sudo mongod --config /usr/local/etc/mongod.conf
end
