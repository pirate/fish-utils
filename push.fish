function push --description "Push specified file (or ~/Desktop/pull by default) to specified path on nicksweeting.com"
	if test (count $argv) -gt 1
        scp -r $argv[1] root@nicksweeting.com:$argv[2]
    else
        scp -r /Users/nick/Desktop/.pull root@nicksweeting.com:$argv[1]
    end
end
