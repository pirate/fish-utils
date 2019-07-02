function debug -a output -a color -a flags -a prefix --description "Print the given debug [output] with the given [color]"
    test -n "$color"; or set color "$yellow"
    set -q prefix[1]; or set prefix "🐞 "

    if [ "$FISHDEBUG" = "1" ]
        echo $flags $dark$prefix$color"$output"$normal 1>&2
    end
end
