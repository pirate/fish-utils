function manage
    set -g DJANGO_ROOT './'
    if test -f $DJANGO_ROOT"manage.py"
        if test -e $DJANGO_ROOT".venv"
            source $DJANGO_ROOT".venv/bin/activate.fish"
        end
        python $DJANGO_ROOT"manage.py" $argv
    else
        while not test -f $DJANGO_ROOT"manage.py"
    	    set DJANGO_ROOT $DJANGO_ROOT"../"
        end
        if test -e $DJANGO_ROOT".venv"
            source $DJANGO_ROOT".venv/bin/activate.fish"
        end
        python $DJANGO_ROOT"manage.py" $argv
    end    
end
