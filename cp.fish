function cp --wraps cp
    /bin/bash -c "trap 'kill \$BGPID' INT; /bin/cp $argv & BGPID=\$!; progress -mp \$BGPID; wait \$BGPID"
end
