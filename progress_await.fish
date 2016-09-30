function progress_await --description 'wait for a specified signal and display . every 1 sec'
    set -l signal_name "$argv"
    quiet mkdir -p ~/tmp/fish_signals
    quiet rm ~/tmp/fish_signals/"$signal_name" # clear out old semaphore
    echo %self > ~/tmp/fish_signals/"$signal_name".waiter

    # wait for the semaphore to be set
    while not test -e ~/tmp/fish_signals/"$signal_name"
        echo -n "."
        sleep 1
    end
    # echo
    rm ~/tmp/fish_signals/"$signal_name".waiter
    sleep 0.05

    if test -s ~/tmp/fish_signals/"$signal_name"
        cat ~/tmp/fish_signals/"$signal_name"
    else
        false
    end
end
