function build
    clear
    switch (count $argv)
    case 1
        switch $argv[1]
        case 'all'
            /usr/local/bin/g++-4.9 *.cpp -o buildout; and ./buildout
        case '*'
            /usr/local/bin/g++-4.9 $argv[1] -o buildout; and ./buildout
        end
    case 0
        /usr/local/bin/g++-4.9 *.cpp -o buildout; and ./buildout
    end
end
