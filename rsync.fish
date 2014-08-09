function rsync
	command rsync -zrP --exclude='*.pyc' --exclude='*.sql.gz' --exclude='.git*' --exclude='sandbox' . $argv
end
