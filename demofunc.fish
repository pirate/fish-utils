function demofunc --description 'function description goes here'
    echo "#: "(count $argv);
    echo "@: "(echo $argv);
    echo "---"
    switch (count $argv)
    case '2'
        echo got two args
    case '1'
        echo got one argument
    case 0
        echo got no arguments
    case '*'
        switch $argv[1]
        case '--switch1'
            echo got --switch1 $argv[2..-1]
        case '--switch2'
            echo got --switch2 $argv[2..-1]
        case '*'
            echo got $argv[1] $argv[2..-1]
        end
    end
end
