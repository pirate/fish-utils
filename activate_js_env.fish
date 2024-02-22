function load_js_env -a path
    set abspath (greadlink -f -- "$path")
    if begin; test -n "$path"; and greadlink -f -- "$PWD" | grep -q "^$abspath"; end
        debug "Loading '$path' js env..." $green
        set -gx ACTIVE_JS_ENV "$abspath"
        and set -gx ACTIVE_JS_PACKAGE (node -pe "require('$path/package.json').name")
        and set -gx ACTIVE_NODE_BIN (which node)
        and set -gx ACTIVE_NODE_VERSION (node --version | perl -pe 's/^v(\d+\.\d+)(\..+)?/$1/gm')
        and set -gx ACTIVE_NPM_BIN (which npm)
        and set -gx ACTIVE_NPM_VERSION (jq -r '.version' "$ACTIVE_JS_ENV/package.json")
        and set -gx ACTIVE_YARN_BIN (which yarn)
        and set -gx ACTIVE_YARN_VERSION (eval "$ACTIVE_YARN_BIN --version")
        return $status
    else
        debug "Deactivating previous ACTIVE_JS_ENV." $yellow
        set -gx ACTIVE_JS_ENV ""
        set -gx ACTIVE_JS_PACKAGE ""
        set -gx ACTIVE_NODE_BIN ""
        set -gx ACTIVE_NODE_VERSION ""
        set -gx ACTIVE_NPM_BIN ""
        set -gx ACTIVE_NPM_VERSION ""
        set -gx ACTIVE_YARN_BIN ""
        set -gx ACTIVE_YARN_VERSION ""
        return 0
    end
end

function print_js_env
    debug "=============================================" $white
    debug "ACTIVE_JS_ENV=$ACTIVE_JS_ENV" $white
    debug "ACTIVE_JS_PACKAGE=$ACTIVE_JS_PACKAGE" $white
    debug "ACTIVE_NODE_BIN=$ACTIVE_NODE_BIN" $white
    debug "ACTIVE_NODE_VERSION=$ACTIVE_NODE_VERSION" $white
    debug "ACTIVE_NPM_BIN=$ACTIVE_NPM_BIN" $white
    debug "ACTIVE_NPM_VERSION=$ACTIVE_NPM_VERSION" $white
    debug "ACTIVE_YARN_BIN=$ACTIVE_YARN_BIN" $white
    debug "ACTIVE_YARN_VERSION=$ACTIVE_YARN_VERSION" $white
    debug "============================================" $white
end

function activate_js_env -a path --description 'Load a python virtual environment'
    print_js_env
    test -n "$path"; or set path (findabove "package.json" "$PWD" "$MAXHOPS" | perl -pe 's/\/package.json//gm')
    load_js_env "$path"
    print_js_env
end
