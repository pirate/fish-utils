function j
	switch "$argv"
        case '-*' '--*'
            autojump $argv
        case '*'
            set -l new_path (autojump $argv)
            if test -d "$new_path"
                set_color red
                echo $new_path
                set_color normal
                cd $new_path
            else
                __aj_not_found $argv
            end
    end
end
