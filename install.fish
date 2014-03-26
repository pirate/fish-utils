function install
	echo "[+] Trying Homebrew:"; brew install $argv; and return;
    echo "[+] Trying Pip (2.7):"; pip install $argv; and return;
    echo "[?] Try using gem & npm?"; read_confirm; or return;
    echo "[+] Trying Ruby Gem:"; sudo gem install $argv; and return;
    echo "[+] Trying Node NPM:"; sudo npm install -g $argv; and return;
    echo "[X] Install failed with all sources"
end
