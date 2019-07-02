function tab -a length -a char --description "Indent a command's output by [number=4] of [character=' ']"
    test -n "$length"; or set length 4
    test -n "$char"; or set char ' '
    
    set indent_str (repeat "$char" $length)
    cat | sed 's/^/'"$indent_str"'/'
end
