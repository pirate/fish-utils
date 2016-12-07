function quiet
    if not count $argv > /dev/null
        return 0
    end

    # quote every argument so spacing is preserved
    set evalstr (string escape -- $argv)
    # eval the command with output silenced
    eval "$evalstr 2>&1 > /dev/null" 2>&1 > /dev/null; and return 0; or return 1
end
