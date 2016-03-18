function service --description 'Run command using sudo (use !! for last command)'
	ls /Users/nick/Library/LaunchAgents/*.plist > ~/.services
    ls /Library/LaunchAgents/*.plist >> ~/.services
    ls -R /Library/StartupItems | grep "*.plist" >> ~/.services
    ls /Library/LaunchDaemons/*.plist >> ~/.services
    ls /System/Library/LaunchAgents/*.plist >> ~/.services
    ls /System/Library/LaunchDaemons/*.plist >> ~/.services
    find /Library/StartupItems -iwholename "*.plist" >> ~/.services

    

    if test (count $argv) -gt 0
        grep -i "$argv[1]" ~/.services | cgrep "$argv[1]"
    else
        grep -v "/System/Library" ~/.services
    end

    # echo "Which one?"
    #     echo ">"(grep -q "$argv[1]" ~/.services)
    #     read -l -p "[#]: " confirm
    #     echo $srv[confirm]

    # ; and echo "Service: "(grep "$argv[1]" ~/.services); or ps aux | grep -v grep | grep $argv[1]; or echo "Service "$argv[1]" not found"
    # if test (count $argv) -gt 1
    #     switch $argv[1]
    #     case 'start'
    #         if test (count $argv) -gt 1
    #             set cmd "command sudo $history[1] $argv[2..-1]"
    #         else
    #             set cmd "command sudo $history[1]"
    #         end
    #         eval $cmd
    #     case 'stop'
    #         set cmd "command sudo "$argv[1]
    #         eval $cmd
    #     case 'restart'
    #         set cmd "command sudo $argv"
    #         eval $cmd
    #     case '*'
    #         set cmd "command sudo $argv"
    #         eval $cmd
    #     end
    # else
    #     echo hi
    # end
end
