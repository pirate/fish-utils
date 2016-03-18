function __fish_command_not_found_handler --on-event fish_command_not_found
    echo "["$red"?"$normal"]"$yellow": "$normal"'$argv'" >&2;
    if quiet j $argv
        echo "Assuming you wanted "(pwd)
        return
    else
        history $argv | head | cgrep $argv >&2;
    end
end
