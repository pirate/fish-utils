function rsync2
	command rsync -zrPhl --progress --size-only --exclude='*.pyc' --exclude='site-packages' --exclude='machine_id.py' --exclude='*.sql.gz' --exclude='.git*' --exclude='sandbox' /Users/squash/drchrono-web/ drstaff:/home/nikisweeting/drchrono-web
and ssh drstaff "rsync -zrPhl --progress --size-only --exclude='*.pyc' --exclude='*.sql.gz' --exclude='site-packages' --exclude='machine_id.py' --exclude='.git*' --exclude='sandbox' /home/nikisweeting/drchrono-web/ pfserver:/home/fabric/drchrono-web"
end
