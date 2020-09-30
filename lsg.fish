function lsg --description 'ls but with git info for each file'
    set files (git ls-tree --name-only HEAD . | sort)
    
    set max 10
    for file in $files
        set length (string length "$file")
        if test $length -gt $max
            set max $length
        end
    end
    for file in $files
        if test -d "$file"
            set filecol (echo "$file/" | ljust $max)
            git log -1 --date="format:%Y-%m-%d $black%H:%M" --pretty="tformat:$green%cd$normal  $cyan%h  $black$filecol  $purple%<(50,trunc)%s $yellow(%cn)$normal  " -- "$file" | cat
        end
    end
    for file in $files
        if not test -d "$file"
            set filecol (echo "$file" | ljust $max)
            git log -1 --date="format:%Y-%m-%d $black%H:%M" --pretty="tformat:$green%cd$normal  $cyan%h  $normal$filecol  $purple%<(50,trunc)%s $yellow(%cn)$normal  " -- "$file" | cat
        end
    end
end
