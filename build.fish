function build
    switch (count $argv)
    case 1
        switch $argv[1]
        case 'all'
            clear; g++ *.cpp -o buildout; and eval ./buildout
        case '*'
            clear; g++ $argv[1] -o buildout; and eval ./buildout
        end
    case 0
        clear; g++ *.cpp -o buildout; and eval ./buildout
    end
end
