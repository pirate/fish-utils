function findandreplace --description 'Replace a regex pattern in all files recursively'
    set -l term "$argv[1]"
    set -l replacement "$argv[2]"
    set -l oldlang $LANG
    set -l oldlc $LC_ALL
    set -x LANG C
    set -x LC_ALL C
    for f in (ag -l "$term")
        echo "$f"
        sed -i "" "s/$term/$replacement/g" "$f"
    end
    set -x LC_ALL $oldlc
    set -x LANG $oldlang
end
