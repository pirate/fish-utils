function apt-get --description 'Pseudo-package manager encompassing brew,pip,gem,npm.'
	if test (count $argv) -gt 0
        switch $argv[1]
            case 'install'
                echoblue "[+] Trying Homebrew:"; brew install $argv[2..-1]; and echoblue "[√] Install succeeded using brew"; and return;
                echoblue "[+] Trying Pip (2.7):"; sudo pip install $argv[2..-1]; and echoblue "[√] Install succeeded using pip"; and return;
                echoblue "[?] Try using gem & npm?"; read_confirm; or return;
                echoblue "[+] Trying Ruby Gem:"; sudo gem install $argv[2..-1]; and echoblue "[√] Install succeeded using gem"; and return;
                echoblue "[+] Trying Node NPM:"; sudo npm install -g $argv[2..-1]; and echoblue "[√] Install succeeded using npm"; and return;
                echoblue "[X] Install failed with all sources"
            case 'remove'
                echoblue "[+] Trying Homebrew:"; brew remove $argv[2..-1]; and echoblue "[√] Removed package using brew"; and return;
                echoblue "[+] Trying Pip (2.7):"; sudo pip uninstall $argv[2..-1]; and echoblue "[√] Removed package using pip"; and return;
                echoblue "[?] Try using gem & npm?"; read_confirm; or return;
                echoblue "[+] Trying Ruby Gem:"; sudo gem uninstall $argv[2..-1]; and echoblue "[√] Removed package using gem"; and return;
                echoblue "[+] Trying Node NPM:"; sudo npm uninstall -g $argv[2..-1]; and echoblue "[√] Removed package using npm"; and return;
                echoblue "[X] Remove failed or package not installed with all sources"
            case 'update'
                echoblue "[+] Trying Homebrew:"; brew update; and echoblue "[√] Updated brew listings";
                echoblue "[+] Trying Pip (2.7):"; sudo pip install --upgrade pip; and echoblue "[√] Updated pip";
                echoblue "[?] Update gem & npm?"; read_confirm; or return;
                echoblue "[+] Trying Ruby Gem:"; sudo gem update --system; and echoblue "[√] Updated Gem listings";
                echoblue "[+] Trying Node NPM:"; sudo brew upgrade node; sudo npm find; and echoblue "[√] Updated NPM listings";
                echoblue "[√] Updated all sources"
            case 'upgrade'
                echoblue "[+] Trying Homebrew:"; brew upgrade $argv[2..-1]; and echoblue "[√] Upgraded package using brew"; and return;
                echoblue "[+] Trying Pip (2.7):"; sudo pip install --upgrade $argv[2..-1]; and echoblue "[√] Upgraded package using pip"; and return;
                echoblue "[?] Try using gem & npm?"; read_confirm; or return;
                echoblue "[+] Trying Ruby Gem:"; sudo gem update $argv[2..-1]; and echoblue "[√] Upgraded package using gem"; and return;
                echoblue "[+] Trying Node NPM:"; sudo npm update -g $argv[2..-1]; and echoblue "[√] Upgraded package using npm"; and return;
                echoblue "[X] Package not installed or upgrade failed with all sources"
            case 'search'
                echoblue "[+] Searching Homebrew:"; brew search $argv[2] | cgrep $argv[2];
                echoblue "[?] Search PyPi for Pip packages?"; read_confirm; or return;
                echoblue "[+] Searching PyPi (2.7):"; pip search $argv[2] | cgrep $argv[2];
                echoblue "[?] Search for Ruby Gems?"; read_confirm; or return;
                echoblue "[+] Searching for Ruby Gems:"; sudo gem search $argv[2] | cgrep $argv[2];
                echoblue "[?] Search for Node NPMs?"; read_confirm; or return;
                echoblue "[+] Searching for Node NPMs:"; sudo npm search $argv[2] | cgrep $argv[2];
            case '*'
                set cmd "command sudo $argv"
                eval $cmd
        end
    else
        command sudo fish
    end
end
