function read_confirm
	while true
        switch (count $argv)
            case 0
                read -g -p read_confirm_prompt confirm
            case '*'
                read -g -p "echo \"$argv\"" confirm
        end
        switch $confirm
            case Y y yes Yes
                return 0
            case '' N n no No
                return 1
        end
  end
end
