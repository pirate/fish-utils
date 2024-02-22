function _dir_status
    set color $cyan
    set pwd (prompt_pwd)

    echo -n -s $color $pwd " "
end

function _docker_status
    set bgcolor (set_color '198e4c')
    set fgcolor (set_color '198e4c')
    # set scolor (set_color '1877e2')
    set symbol "⚃"

    if [ "$ACTIVE_DOCKER_ENV" ]
        # set path (echo "$ACTIVE_DOCKER_ENV" | perl -pe "s/\/Users\/$USER/~/g")
        # set name (basename "$path")
        # echo -n -s $bgcolor $symbol $dark "(" $normal $fgcolor $name$dark:$scolor$num_services $dark ")" $normal $bgcolor " "
        # set num_services (docker compose ps --services | wc -l | xargs)
        echo -n -s $bgcolor $symbol $dark "(" $normal $fgcolor $ACTIVE_DOCKER_SERVICES $dark ")" $normal $bgcolor " "
    end
end

function _venv_status
    set bgcolor (set_color 'ffa632')
    set fgcolor (set_color 'ffa632')
    set vcolor (set_color '1877e2')
    set symbol "⍴"

    if begin; [ "$ACTIVE_PY_NAME" ]; and [ "$ACTIVE_PY_NAME" != 'usr' ]; and [ "$ACTIVE_PY_NAME" != 'python' ]; end
        echo -n -s $bgcolor $symbol $dark "(" $normal $fgcolor $ACTIVE_PY_NAME$dark:$vcolor$ACTIVE_PY_VERSION $dark ")" $normal $bgcolor " "
    # else if [ "$ACTIVE_PY_ENV" ]
    #     set name (basename -- "$ACTIVE_PY_ENV")
    #     echo -n -s $bgcolor $symbol $dark "(" $normal $fgcolor $name $dark ")" $normal $bgcolor " "
    end
end

function _node_status
    set bgcolor (set_color '709825')
    set fgcolor (set_color brmagenta)
    set vcolor (set_color '1877e2')
    set symbol "⬢"
    # set symbol "№"

    if [ "$ACTIVE_JS_ENV" ]
        # echo -n -s $bgcolor $symbol $dark "(" $normal $fgcolor $npm_pkgname$dark:$vcolor$npm_version $dark ")" $normal $bgcolor " "
        echo -n -s $bgcolor $symbol $dark "(" $normal$fgcolor$ACTIVE_NPM_VERSION$dark:$vcolor$ACTIVE_NODE_VERSION $dark ")" $normal $bgcolor " "
    end
end

function _git_status
    set bgcolor (set_color '1877e2')
    set fgcolor (set_color '1877e2')
    set bgcolor_dirty (set_color 'b21394')
    set fgcolor_dirty (set_color 'b21394')
    set symbol "⎇ "
    set dirty_symbol "❈"   # ✗

    if [ "$GIT_BRANCH" ]
        set branch "$GIT_BRANCH"
        set dirty_count (git status -s --ignore-submodules=dirty | wc -l | awk '{print $1}')
        if [ "$dirty_count" -gt 0 ]
            set dirty_str " "$bgcolor_dirty$dirty_symbol$fgcolor_dirty$dirty_count
        end
        switch "$branch"
        case master;   set fgcolor "$red"
        case staging;  set fgcolor "$yellow"
        case dev;      set fgcolor "$green"
        end
        echo -n -s $bgcolor $symbol $dark "(" $normal $fgcolor $branch $dark ")" $normal $dirty_str $bgcolor " "
    end
end


function _print_last_status
    set bgcolor $normal
    set fgcolor_time $yellow
    set fgcolor_status $red
    set status_str ""
    set time_str ""
    set separator ""

    if [ "$LAST_CMD_DURATION" -gt 3000 ]
        set rounded (math "$LAST_CMD_DURATION/1000")
        set time_str $fgcolor_time$rounded"s"
    end
    if [ "$LAST_CMD_STATUS" != 0 -a "$LAST_CMD_STATUS" != 127 ]
        set status_str $fgcolor_status$LAST_CMD_STATUS
    end
    if [ "$status_str" -a "$time_str" ]
        set separator $bgcolor":"
    end
    if [ "$status_str" -o "$time_str" ]
        echo -s $bgcolor "[" $status_str $separator $time_str $bgcolor "]"
    end
end

function _blink_last_status
    if [ "$LAST_CMD_STATUS" = "0" ]
        background "blink 1 0.1"
    else
        background "blink 2 0.2"
    end
end

function _log_last_status
    echo -s \
        "$LAST_CMD_STATUS" "," \
        "$LAST_CMD_DURATION" "ms" "," \
        "$LAST_CMD_DATE" "," \
        "$LAST_CMD_PWD" "," \
        "$LAST_CMD" \
        >> "$STATS_FILE"
end

function fish_prompt
    set -gx LAST_CMD_STATUS "$status"
    set -gx LAST_CMD_DURATION "$CMD_DURATION"
    set -gx LAST_CMD_DATE (date +"%Y-%m-%d_%H-%M-%S")
    set -gx LAST_CMD_PWD \"$PWD\"
    set -gx LAST_CMD \"$history[1]\"

    # set start (gdate +%s%3N)

    set -gx GIT_BRANCH (git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')

    _log_last_status
    _print_last_status
    _blink_last_status

    # run automatically by cd function:
    # activate_docker_env
    # activate_py_env
    # activate_js_env

    echo -n -s -- \
        $red"➜ " \
        (_venv_status) \
        (_node_status) \
        (_docker_status) \
        (_git_status) \
        (_dir_status) \
        $dark"#"$normal" "

    # set end (gdate +%s%3N)

    # echo ""
    # echo "Total: "(math $end-$start)"ms"
end
