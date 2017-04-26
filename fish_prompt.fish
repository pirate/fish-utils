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

    # show time taken if more than 3000ms
    if [ $taken -lt 3000 ]
        set taken "0"
    else
        set taken (math "$taken/1000")
    end

    # show color coded git branch and dirty status
    set -l git_branch (_git_branch_name)
    if [ $git_branch ]
        set branch_color (_branch_color $git_branch)
        set git_info $blue"("$branch_color$git_branch$blue")"

        if [ (_is_git_dirty) ]
        set git_dirty " ✗"
        end
    end

    # show python virtualenv
    if set -q VIRTUAL_ENV
        set venv $blue"["$red(basename "$VIRTUAL_ENV")$blue"]"
        # set venv $yellow(basename "$VIRTUAL_ENV")
    end

    # log last command to stats file
    /usr/bin/touch ~/.stats/commands.csv
    echo "$last_status,$taken,$timestamp,'"$currdir"','"$last"'" >> ~/.stats/commands.csv


    # assemble status strings
    if [ "$taken" != "0" ]
        set statusstr $yellow$taken"s"$normal
    end

    if [ "$last_status" != "0" -a "$last_status" != "127" ]
        if [ "$taken" != "0" ]
            set statusstr ":"$statusstr
        end
        set statusstr $red$last_status$normal$statusstr
    end

    if [ "$statusstr" ]
        echo "["$statusstr"]"
    end

    # print console line
    echo -n -s $red$arrow $cyan$current_dir $yellow" py"$venv $blue" ⎇ "$git_info $purple$git_dirty $normal " "
end
