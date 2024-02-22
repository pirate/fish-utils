function load_py_env -a path
    set abspath (greadlink -f -- "$path")
    if begin; test -n "$path"; and greadlink -f -- "$PWD" | grep -q "^$abspath"; end
        if not test -e "$path/.venv/bin/activate.fish"
            debug "[X] The specified virtualenv path '$path' does not exist." $red
            return 1
        end
        if not source "$path/.venv/bin/activate.fish"
            debug "[X] Failed to activate the virtualenv '$path/.venv/bin/activate.fish'." $red
            return 1
        end
        debug "Loading '$path' py env..." $green
        set -xg ACTIVE_PY_ENV "$path/.venv"
        and set -xg ACTIVE_PY_NAME (basename -- "$path")
        and set -xg ACTIVE_PY_BIN (which python)
        and set -xg ACTIVE_PIP_BIN (which pip)
        and set -xg ACTIVE_PY_VERSION (python --version | awk '{print $2}' | perl -pe 's/^(\d+\.\d+)(\..+)?/$1/gm')
        and set -xg ACTIVE_PIP_VERSION (pip --version | perl -pe 's/(\d+\.\d+)(\..+)?/$1/gm')
        return $status
    else
        if functions -q deactivate
            deactivate
        end
        set -xg ACTIVE_PY_ENV ""
        and set -xg ACTIVE_PY_NAME ""
        and set -xg ACTIVE_PY_BIN ""
        and set -xg ACTIVE_PY_VERSION ""
        and set -xg ACTIVE_PIP_BIN ""
        and set -xg ACTIVE_PIP_VERSION ""
        return $status
    end
end

function print_py_env
    debug "=============================================" $white
    debug "ACTIVE_PY_ENV=$ACTIVE_PY_ENV" $white
    debug "ACTIVE_PY_NAME=$ACTIVE_PY_NAME" $white
    debug "ACTIVE_PY_BIN=$ACTIVE_PY_BIN" $white
    debug "ACTIVE_PY_VERSION=$ACTIVE_PY_VERSION" $white
    debug "ACTIVE_PIP_BIN=$ACTIVE_PIP_BIN" $white
    debug "ACTIVE_PIP_VERSION=$ACTIVE_PIP_VERSION" $white
    debug "=============================================" $white
end


function activate_py_env -a path --description 'Load a python virtual environment'
    print_py_env
    test -n "$path"; or set path (findabove ".venv" "$PWD" "$MAXHOPS" | perl -pe 's/\/.venv//gm')
    load_py_env "$path"
    print_py_env
end
