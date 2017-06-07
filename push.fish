function push --description "Push specified [file] to specified [path] on nicksweeting.com"
	if test (count $argv) -gt 1
        set src "$argv[1]"
        set dst "$argv[2]"
    else
        set src "$argv[1]"
        set dst "/var/www/files/"
    end
    scp -r "$src" root@nicksweeting.com:"$dst"
    and blink 1 &
end
