function rm
	if quiet sudo mv "$argv" ~/.Trash/
        return
    else
        # or it can sometimes fail because that file already exists
        mkdir -p ~/.Trash/Duplicates
        sudo mv "$argv" ~/.Trash/Duplicates/
    end
end
