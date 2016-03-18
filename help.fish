function help --description 'description'
    switch (count $argv)
    case '1'
        switch $argv[1]
        case 'arg1'
            echo got known arg1
        case '*'
            echo got other $argv[1]
        end
    case 0
        echo got no arguments
    case '*'
        echo $argv[1..-1]
    end
end
