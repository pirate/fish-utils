function autocomplete --description 'complete specified function using command'
    switch (count $argv)
    case '3'
        set name $argv[3]
        set func $argv[1]
        set comm $argv[2]
    case '2'
        set name "-"
        set func $argv[1]
        set comm $argv[2]
    case '*'
        echo "specify a function, a command to generate its completions, and an optional description"
        echo "e.g autocomplete gch \"(g branch -q | regex 's/ |\* //g')\" \"Branch\""
        return
    end
    echo "complete -x -c $func -d \"$name\" -a \"$comm\"" >> /Users/squash/.config/fish/completions/$func.fish
end
