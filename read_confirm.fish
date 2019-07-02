function read_confirm
	set result 1
    while true
        switch (count $argv)
        case 0
            read -g -p read_confirm_prompt confirm
        case '*'
            read -g -p "echo \"$argv\"" confirm
        end
        switch $confirm
        case Y y yes Yes
            set result 0
            break
        case '' N n no No
            set result 1
            break
        end
    end
    return $result
end
