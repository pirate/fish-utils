function beep --description 'SSH into nicksweeting.com and run a command'
    if test "$argv"
        ssh -q root@nicksweeting.com -t "$argv"
    else
        ssh root@nicksweeting.com
    end
end
