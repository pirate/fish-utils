function fish_greeting
    # Only run if it's a login shell
    # squash@squash.local: 10.0.0.3
    #  ________________________________________ 
    # /                                        \
    # |                                        |
    # \                                        /
    #  ---------------------------------------- 
    #         \   ^__^
    #          \  (oo)\_______
    #             (__)\       )\/\
    #                 ||----w |
    #                 ||     ||
    # ➜ ~ py:(test) 
    echo -n $yellow(whoami)$normal"@"$purple(hostname -f)$normal
    echo ": "$red(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | xargs)$normal
    fortune -a -s | cowsay | lolcat
    
    # if test -e ~/.fishpowerline                         # start powerline by detecting the powerline flag file
    #     rm ~/.fishpowerline
    #     set fish_function_path $fish_function_path ". /usr/local/lib/python2.7/site-packages/powerline/bindings/fish"
    #     powerline-setup
    # end
end
