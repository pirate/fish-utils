function hask --description 'use this to haskell your code file'
    switch (count $argv)
    case '1'
        ghc $argv; and echo -e "----------------------------\n"; and eval "./$argv"
    case 0
        ghci
    case '*'
        echo "uhh whut, only 1 argument man, the file you're trying to haskell. (or no args for ghci)"
    end
end
