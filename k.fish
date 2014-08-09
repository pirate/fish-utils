function k
	quiet killall "$argv"; and echo "Killed"; and return;

    set -l proc (psax "$argv" | head -1);
    set -l proccount (psax "$argv" | wc -l | awk '{print $1}');

    if test $proccount = 0
        echo "No process found."; and return
    else if test $proccount -ne 1;
        echo "Multiple processes found."
        psax "$argv"
        read -l -p "echo PID or 'all': " tokill
        if test "$tokill" = "all"
            kill (psax "$argv" | awk '{print $1}'); and return
        end    
        set proc (psax "$argv" | grep "^$tokill.*\$"; or echo "none")
        if test "$proc" = "none"
            echo "Process not found."
            return
        end
    end
        echo "Kill: $proc";      and read_confirm; or return; and kill                 (echo $proc | awk '{print $1}'); and echo "Killed";          and return;
        or echo "Kill -9?";      and read_confirm; or return; and kill -9              (echo $proc | awk '{print $1}'); and echo "Killed -9";       and return;
        or echo "Sudo Kill -9?"; and read_confirm; or return; and sudo -u root kill -9 (echo $proc | awk '{print $1}'); and echo "Sudo Killed -9";  and return;
end
