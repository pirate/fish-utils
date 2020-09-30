function progress_await --description 'wait for a specified signal and display . every 1 sec'
    # same as "await" but displays progress dots while waiting for signal
    set -l signal_name "$argv"
    quiet mkdir -p ~/tmp/fish_signals
    quiet rm ~/tmp/fish_signals/"$signal_name" # clear out old semaphore
    echo %self > ~/tmp/fish_signals/"$signal_name".waiter

    # wait for the semaphore to be set
    while not test -e ~/tmp/fish_signals/"$signal_name"
        echo -n "."
        sleep 1
    end

    # move this rm to after the cat if you want signal handler 
    # to fire "at least once" instead of "at most once"
    rm ~/tmp/fish_signals/"$signal_name".waiter
    sleep 0.05

    if test -s ~/tmp/fish_signals/"$signal_name"
        # as a convenience, signal setter can store some text
        # in the signal file for us to pass to the signal handler
        cat ~/tmp/fish_signals/"$signal_name"
        return 0
    else
        # some earlier step was aborted (e.g. CTRL+C)
        # but no signal was actually set
        return 1
    end
end
