function j
    switch "$argv"
        case '-*' '--*'
            autojump $argv
        case '*'
            set -l output (autojump $argv)
            if test -d "$output"
                set_color red
                echo $output
                set_color normal
                cd $output
            else
                __aj_err "autojump: directory '"$argv"' not found"
                __aj_err "\n$output\n"
                __aj_err "Try `autojump --help` for more information."
            end
    end
end
