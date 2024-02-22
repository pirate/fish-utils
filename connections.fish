function connections -a port -d 'Get open connections on a given port'
    test -z $port; and begin
        echo >&2 (status function)': port missing'
        return 1
    end

    lsof +c 0 -i :$port | grep ESTABLISHED
end
