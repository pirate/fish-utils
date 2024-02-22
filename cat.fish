function cat --wraps=bat --description 'alias cat=bat'
    if count $argv >/dev/null
        bat $argv
    else
        bat -P --style=plain -l python
    end
end
