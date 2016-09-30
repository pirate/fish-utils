function _git_branch_name
    echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
    echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function _branch_color
    set -l branch_color $white
    switch $argv
    case master
        set branch_color "$red"
    case staging
        set branch_color "$yellow"
    case dev
        set branch_color "$green"
    end
    echo $branch_color
end

function fish_prompt
    set -l last_status $status
    set -l taken "$CMD_DURATION"
    set -l git_dirty ""
    set -l statusstr ""
    set -l current_dir (prompt_pwd)
    set -l currdir \"(pwd)\"
    set -l last \"$history[1]\"
    set -l timestamp (date +"%Y-%m-%d_%H")

    set -l time_taken (echo "$taken" | ggrep -oP '(^|\s)\K\d+(?=(\.\d+s$)|s$)')

    if begin; test "$taken" = ""; or test "$time_taken" -lt 3; end
        set taken "0"
    else
        set taken $CMD_DURATION
    end

    set -l git_branch (_git_branch_name)
    if [ $git_branch ]
        set branch_color (_branch_color $git_branch)
        set git_info $blue"("$branch_color$git_branch$blue")"

        if [ (_is_git_dirty) ]
        set git_dirty " ✗"
        end
    end

    if set -q VIRTUAL_ENV
        set venv $blue"["$red(basename "$VIRTUAL_ENV")$blue"]"
    end

    /usr/bin/touch ~/.stats/commands.csv
    echo "$last_status,$taken,$timestamp,'"$currdir"','"$last"'" >> ~/.stats/commands.csv

    if test "$taken" != "0"
        set statusstr $yellow$taken$normal
    end

    if test "$last_status" != "0" -a "$last_status" != "127"
        if test "$taken" != "0"
            set statusstr ":"$statusstr
        end
        set statusstr $red$last_status$normal$statusstr
    end

    if test -n "$statusstr"
        echo "["$statusstr"]"
    end

    echo -n -s $red$arrow $cyan$current_dir $yellow" py"$venv $blue" ⎇ "$git_info $purple$git_dirty $normal " "
end
