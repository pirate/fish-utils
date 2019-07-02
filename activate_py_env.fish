function load_py_env -a path
    if test -n "$path"
        if not test -e "$path/bin/activate.fish"
            debug "[X] The specified virtualenv path '$path' does not exist." $red
            return 1
        end
        if not source "$path/bin/activate.fish"
            debug "[X] Failed to activate the virtualenv '$path/bin/activate.fish'." $red
            return 1
        end
        debug "Loading '$path' py env..." $green
        set abspath (greadlink -f -- "$path")
        set -xg ACTIVE_PY_ENV "$path"
        and set -xg ACTIVE_PY_BIN (which python)
        and set -xg ACTIVE_PIP_BIN (which python)
        and set -xg ACTIVE_PY_VERSION (python --version)
        and set -xg ACTIVE_PIP_VERSION (pip --version)
        return $status
    else
        if functions -q deactivate
            deactivate
        end
        set -xg ACTIVE_PY_ENV ""
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
    debug "ACTIVE_PY_BIN=$USE_PY_ENV" $white
    debug "ACTIVE_PY_VERSION=$ACTIVE_PY_VERSION" $white
    debug "ACTIVE_PIP_BIN=$USE_PY_ENV" $white
    debug "ACTIVE_PIP_VERSION=$ACTIVE_PIP_VERSION" $white
    debug "=============================================" $white
end


function activate_py_env -a path --description 'Load a python virtual environment'
    print_py_env
    test -n "$path"; or set path (findabove ".venv" "$PWD" "$MAXHOPS")
    load_py_env "$path"
    print_py_env
end
