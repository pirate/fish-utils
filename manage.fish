function manage
    set -l manage_location 'manage.py'
    while not test -f $manage_location
	    set manage_location "../"$manage_location
    end
    python $manage_location $argv
end
