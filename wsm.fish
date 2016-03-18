function wsm --description 'SSH into wsm[$1] and run a command [$2], e.g. `wsm all uptime` or `wsm 6 htop` or just `wsm 5`'
    switch (count $argv)
    case '1'
    	ssh -p 19249 squash@staff.drchrono.com -t "ssh -p 22 root@wsm$argv -t 'fish'"
    case '2'
        if test $argv[1] = 'all'
            for i in (seq 1 16);
                echo "[wsm$i]:"
                ssh -q -p 19249 squash@staff.drchrono.com -t "ssh -q -p 22 root@wsm$i -t 'fish -i -c \"$argv[2]\"'"
            end
        else
            ssh -q -p 19249 squash@staff.drchrono.com -t "ssh -q -p 22 root@wsm$argv[1] -t 'fish -i -c \"$argv[2]\"'"
        end
    end
end
