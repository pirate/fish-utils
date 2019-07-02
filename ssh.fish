function ssh
	set -x SSH_HOST "SSH"
    echo -ne "\033]0;$argv[1]\007"
    command ssh -t $argv
end
