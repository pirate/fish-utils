function shortload --description 'Get the system load average over the last minute'
    uptime | perl -pe 's/.*load averages: (\d+\.\d\d) .*$/$1/'
end
