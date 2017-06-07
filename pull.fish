function pull --description 'Pull specified file from nicksweeting.com to specified path on local (or ~/Desktop/pull by default)'
	if test (count $argv) -gt 1
        set src "$argv[1]"
        set dst "$argv[2]"

    else
        set src "$argv[1]"
        set dst "/Users/squash/Desktop/"(basename "$src")
    end
    scp -r root@nicksweeting.com:"$src" "$dst"; and subl "$dst"
end
