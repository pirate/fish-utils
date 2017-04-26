function learn_location
    set locname ""
    switch (count $argv)
    case 0
    	echo "Name of location: "
        read locname
    case '*'
        set locname "$argv"
        echo "Name of location: $locname"
    end
    whereami learn -n 20 -l "$locname"
    echo "$locname" > ~/tmp/last_location
    open "bitbar://refreshPlugin?name=*.whereami.*"
end
