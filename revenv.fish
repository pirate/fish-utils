function revenv
	mv ~/.virtualenvs/$argv ~/.Trash/$argv.(date +%s)
    cd ~/.virtualenvs
    virtualenv -p /usr/local/bin/python3 $argv
    cd -
    vf activate $argv
    vf connect $argv
    pip install --upgrade pip setuptools virtualenv
    and echo $green"[√] Deleted & recreated $argv venv..."$normal
end
