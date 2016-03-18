function signal --description 'signal a process thats waiting on a semaphore'
    if isatty stdin
        quiet command rm ~/tmp/fish_signals/"$argv"
        command touch ~/tmp/fish_signals/"$argv"
    else
        cat - > ~/tmp/fish_signals/"$argv"
    end
end
