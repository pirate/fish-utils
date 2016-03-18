function django.start
	if test $VIRTUAL_ENV
        set -l pid (psax $VIRTUAL_ENV | grep runserver | awk '{print $1}')
        test $pid; and echo "Killing Other Django..."; and k $pid
    else
        k runserver
    end
    echo "Starting Django..."
    manage runserver_plus $argv &
end
