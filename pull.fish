function pull --description 'Pull specified file from nicksweeting.com to specified path on local (or ~/Desktop/pull by default)'
	if test (count $argv) -gt 1
        scp -r -P 44 root@nicksweeting.com:$argv[1] $argv[2]; and subl $argv[2]
    else
        scp -r -P 44 root@nicksweeting.com:$argv[1] /Users/nick/Desktop/pull; and subl /Users/nick/Desktop/pull
    end
end
