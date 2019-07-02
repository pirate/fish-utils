function add_paths -a paths --description 'Add the specified array of [paths] to the environment $PATH (ignoring duplicates)'
    set dir_list (string split ' ' $paths)
    debug "Merging "(count $dir_list)" paths into shell PATH." $green
    for bin_dir in $dir_list
        if not test -d "$bin_dir"
            debug "Failed to add entry to PATH, '$bin_dir' is not a valid directory." $red
            # return 1
            continue
        end
        if string match -q -e "$bin_dir" "$PATH"
            debug "Entry '$bin_dir' is already in PATH, skipping." $yellow
            continue
        end
        set -xgp PATH "$bin_dir"
        and debug "Added $bin_dir to PATH." $green
    end
end

function add_env_var -a key -a val --description 'Add the specified [key] and [val] to add into the current shell session.'
    if not test -n "$key"
        debug "Failed to add environment variable, key is empty in '$key=$val'." $red
    end
    set -xga ACTIVE_DOT_ENV_VARS "$key=$val"
    and set -xg "$key" "$val"
    and debug "Set environment variable $key=$val." $green
end

function load_dot_env -a path
    if test -n "$path"
        debug "Loading '$path' dot env..." $green
        set abspath (greadlink -f -- "$path")
        set -xg ACTIVE_DOT_ENV "$path"
        set -xg ACTIVE_DOT_ENV_VARS ""
        set -xg ADD_PATHS ""
        for line in (ggrep -Po '^(\w+)=(.*)$' "$path")
            set key (echo -- "$line" | cut -d = -f 1 | string upper)
            set val (echo -- "$line" | cut -d = -f 2-)
            if [ "$key" = "ADD_PATHS" ]
                add_paths "$val"
                add_env_var "$key" "$val"
            else
                add_env_var "$key" "$val"
            end
        end
    else
        debug "Deactivating previous ACTIVE_DOT_ENV." $yellow
        set -xg ACTIVE_DOT_ENV ""
        set -xg ACTIVE_DOT_ENV_VARS ""
        set -xg ADD_PATHS ""
        set -xg PATH $BASE_PATHS
        return 0
    end
end

function print_dot_env
    debug "============================================" $white
    debug "ACTIVE_DOT_ENV=$ACTIVE_DOT_ENV" $white
    debug "ACTIVE_DOT_ENV_VARS=$ACTIVE_DOT_ENV_VARS" $white
    debug "ADD_PATHS=$ADD_PATHS" $white
    debug "PATH=$PATH" $white
    debug "============================================" $white
end

function activate_dot_env -a path --description 'Load environment variables from a [.env] file'
    print_dot_env
    test -n "$path"; or set path (findabove ".env" "$PWD" "$MAXHOPS")
    load_dot_env "$path"
    print_dot_env
end

