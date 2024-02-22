function mv
/bin/bash -c "trap 'kill \$BGPID' INT; /bin/mv $argv & BGPID=\$!; progress -mp \$BGPID; wait \$BGPID"
end
