function o --description "Open [app] [file]"
    switch (count $argv)
    case 2
        open -a (find_app $argv[1]) $argv[2]
    case 1
        quiet open "$argv"
        or quiet open (find_file "$argv")
        or quiet open (find_app "$argv")
        or return 1
    case 0
        quiet open .
    end
end
