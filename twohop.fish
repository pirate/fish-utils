function twohop
	scp -R $argv[1] drstaff:./tmp/$argv[1];
    ssh drstaff "scp -r ./tmp/$argv[1] pfserver:$argv[2]"
end
