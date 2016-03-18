function build
    clear
    switch (count $argv)
    case 1
        switch $argv[1]
        case 'all'
            g++-5 -std=c++11 *.cpp -o buildout; and ./buildout
        case '*'
            g++-5 -std=c++11 $argv[1] -o buildout; and ./buildout
        end
    case 0
        g++-5 -std=c++11 *.cpp -o buildout; and ./buildout
    end
end
