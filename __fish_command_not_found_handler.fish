function __fish_command_not_found_handler --on-event fish_command_not_found
    echo "["$red"?"$normal"]"$yellow": "$normal"'$argv'" >&2;
    history $argv | head | cgrep $argv >&2;
    echo './'(find_file $argv)

    # autojump $argv
end
