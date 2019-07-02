function findabove -a name -a dir -a hops --description 'Find the nearest [file] up the tree from the given [dir] [hops]'
    test -n "$hops"; or set hops "$MAXHOPS"
    set dir (greadlink -f -- "$dir")

    if test -e "$dir/$name"
        debug "$name" $blue
        echo "$dir/$name"
    else
        set parent (dirname -- "$dir")
        set hops (math "$hops"-1)
        if [ "$parent" = "/" -o "$hops" -le 0 ]
            # debug "$name (not found)" $red
            return 1
        else
            # debug "../" $blue -n " "
            findabove "$name" "$parent" "$hops"
        end
    end
end
