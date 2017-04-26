function funcsubl --description "Edit or create a function using Sublime Text"
    if test -e "/Users/squash/.config/fish/functions/$argv.fish"
        subl "/Users/squash/.config/fish/functions/$argv.fish"
    else
	   cp /Users/squash/.config/fish/functions/templatefunc.fish "/Users/squash/.config/fish/functions/$argv.fish"
       perl -pi -e "s/templatefunc/$argv/g" "/Users/squash/.config/fish/functions/$argv.fish"
       subl "/Users/squash/.config/fish/functions/$argv.fish"
    end
end
