function roiup
	scp -r /var/www/roicalc drstaff:"~"; ssh drstaff "scp -r roicalc root@blog:/var/www/blog"
end
