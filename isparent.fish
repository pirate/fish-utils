function isparent -a parent -a child --description 'Check if a given [parent] path is above a given [child]'
    set parent (greadlink -f -- "$parent" | string trim -r -c '/')
    set child (greadlink -f -- "$child" | string trim -r -c '/')

    if string match -q --regex "^$parent/" "$child/"
        return 0
    else
        return 1
    end
end
