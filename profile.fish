function profile --description 'description'
    mysql.start
    redis.start
    nginx.start
    celery.start
    rm /Users/squash/Desktop/profiles
    mkdir /Users/squash/Desktop/profiles
    open /Users/squash/Desktop/profiles
    echo "Starting Django With Profiling..."
    if test $VIRTUAL_ENV
        set -l pid (psax $VIRTUAL_ENV | grep runserver | awk '{print $1}')
        test $pid; and k $pid
    else
        k runserver
    end
    manage runprofileserver 0:8000 --kcachegrind --prof-path=/Users/squash/Desktop/profiles
end
