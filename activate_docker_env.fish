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
    set -xga ACTIVE_DOCKER_ENV_VARS "$key=$val"
    and set -xg "$key" "$val"
    and debug "Set environment variable $key=$val." $green
end

function load_docker_env -a path
    set abspath (greadlink -f -- "$path")
    if begin; test -n "$path"; and greadlink -f -- "$PWD" | grep -q "^$abspath"; end
        debug "Loading '$path' Docker compose environment..." $green
        set -xg ACTIVE_DOCKER_ENV "$path"
        set -xg ACTIVE_DOCKER_ENV_VARS ""
        set -xg ACTIVE_DOCKER_SERVICES (docker compose ps --services | wc -l | xargs)
        set -xg ADD_PATHS ""
        if test -f "$path/.env"
            for line in (ggrep -Po '^(\w+)=(.*)$' "$path/.env")
                set key (echo -- "$line" | cut -d = -f 1 | string upper)
                set val (echo -- "$line" | cut -d = -f 2-)
                if [ "$key" = "ADD_PATHS" ]
                    add_paths "$val"
                    add_env_var "$key" "$val"
                else
                    add_env_var "$key" "$val"
                end
            end
        end
        
    else
        debug "Deactivating previous ACTIVE_DOCKER_ENV." $yellow
        set -xg ACTIVE_DOCKER_ENV ""
        set -xg ACTIVE_DOCKER_SERVICES ""
        set -xg ACTIVE_DOCKER_ENV_VARS ""
        set -xg ADD_PATHS ""
        set -xg PATH $BASE_PATHS
        return 0
    end
end

function print_docker_env
    debug "============================================" $white
    debug "ACTIVE_DOCKER_ENV=$ACTIVE_DOCKER_ENV" $white
    debug "ACTIVE_DOCKER_SERVICES=$ACTIVE_DOCKER_SERVICES" $white
    debug "ACTIVE_DOCKER_ENV_VARS=$ACTIVE_DOCKER_ENV_VARS" $white
    debug "ADD_PATHS=$ADD_PATHS" $white
    debug "PATH=$PATH" $white
    debug "============================================" $white
end

function activate_docker_env -a path --description 'Load environment variables from a [.env] file'
    print_docker_env
    test -n "$path"; or set path (findabove "docker-compose.yml" "$PWD" "$MAXHOPS" | perl -pe 's/\/docker-compose.yml//gm')
    load_docker_env "$path"
    print_docker_env
end

