function funcdel
	functions -e $argv
mv ~/.config/fish/functions/$argv.fish ~/.Trash/
end
