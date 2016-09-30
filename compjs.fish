function compjs --description 'Compile all JS files in grater-django, or specify [filename] to compile'
    switch (count $argv)
    case '1'
        # find the JS source file in pages/
        set js_src (find_file "$argv" ~/Code/grater-project/grater-django/src/pages/)

        echo $blue"[*] Browserifying"$normal" src/pages/"$yellow"$js_src"$normal

        # browserify the file, and show a progress bar in the process
        background progress_await browserify_$js_src
        browserify ~/Code/grater-project/grater-django/src/pages/$js_src > ~/Code/grater-project/grater-django/static/src/pages/$js_src
        and signal "browserify_$js_src"
        and echo; and echo $green"[√] Done"$normal" > static/src/pages/"$yellow"$js_src"$normal; and return 0
        or signal "browserify_$js_src"
        echo $red"[X] Failed"$normal" > static/src/pages/"$yellow"$js_src"$normal
        return 1
    case 0
        echo $purple"[#] Browserifying all "$normal" src/pages/"$yellow"*.js"
        echo
        # browserify all JS files simultaneously
        for filename in (command ls src/pages/*.js | cat)
            set js_src (echo $filename | regex 's/.*\/(\w+\.js)$/$1/gm')
            background compjs "$js_src"
        end
    case '*'
        echo "Usage:"
        echo "    compjs             no arguments compiles all JS pages"
        echo "    compjs home        single argument fuzzy matches for a js page"
        echo "    compjs home.js     or specify the full filename"
    end
end
