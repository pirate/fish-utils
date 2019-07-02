function funcsubl --description "Edit or create a function using Sublime Text"
    set funcname "$argv[1]"
    set functemplate "$HOME/.config/fish/functions/templatefunc.fish"
    set existingbin (/usr/bin/which "$funcname")
    set existingfunc (functions -D "$funcname")
    set newfunc "$HOME/.config/fish/functions/$funcname.fish"

    if [ "$existingfunc" = "n/a" ]
        if test -n "$existingbin"
            read_confirm $red"[!] A binary $existingbin already exists, are you sure you want to shadow it? Y/[n] "$normal
            or return 1
        end
        echo $yellow"[+] Creating new function $newfunc..."$normal
        cp "$functemplate" "$HOME/.config/fish/functions/$funcname.fish"
        perl -pi -e "s/templatefunc/$funcname/g" "$HOME/.config/fish/functions/$funcname.fish"
        functions -v -D "$funcname" | tab
        subl "$HOME/.config/fish/functions/$funcname.fish"
    else
        echo $yellow"[*] Editing existing function $existingfunc..."$normal
        functions -v -D "$funcname" | tab
        subl "$existingfunc"
    end

    echo $green"[√] Make sure to run 'reload' in the current shell after saving your changes."$normal
end
