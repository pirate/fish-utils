function funcsubl --description "Edit or create a function using Sublime Text"
    if test -e "/Users/nick/.config/fish/functions/$argv.fish"
        subl "/Users/nick/.config/fish/functions/$argv.fish"
    else
	   cp /Users/nick/.config/fish/functions/templatefunc.fish "/Users/nick/.config/fish/functions/$argv.fish"
       perl -pi -e "s/templatefunc/$argv/g" "/Users/nick/.config/fish/functions/$argv.fish"
       subl "/Users/nick/.config/fish/functions/$argv.fish"
    end
end
