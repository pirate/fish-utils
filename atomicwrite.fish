function atomicwrite --description 'Write a [string] to a [file] atomically (overwites any existing)'
    function showhelp
        echo "Write the given string to a temporary file, then atomically move it onto a destination."
        echo "String to write can be passed as first argument or piped via stdin."
        echo "Pass -x to delete any existing destination file without backing it up to ~/.Trash first."
        echo "Pass -t to do a test dry run and show the results without modifying any files on disk."
        echo ""
        echo $blue"Usage:"$normal
        echo ""
        echo "    atomicwrite [-h|--help] [-t|--dryrun] [-x|--notrash] [string] path"
        echo ""
        echo $blue"Examples:"$normal
        echo ""
        echo "    atomicwrite -h                            show this help message"
        echo "    atomicwrite -t                            show results of a dry-run without modifying any files"
        echo "    atomicwrite -x                            don't back up any overwritten files to ~/.Trash"
        echo "    atomicwrite -n                            use non-unique temp filenames (don't append a UUID)"
        echo "    atomicwrite 'abc' xyz.txt                 write the string 'abc' to the file xyz.txt"
        echo "    atomicwrite xyz.txt < (echo 'abc')        write the string 'abc' to the file xyz.txt"
        echo ""
    end

    argparse --name=atomicwrite -X 2 'h/help' 'x/notrash' 't/dryrun' 'n/nonunique' -- $argv
    or return 2

    if test -n "$_flag_help"
        showhelp
        return 0
    end

    switch (count $argv)
    case '2'
        set srcstr "$argv[1]"
        set dstfile "$argv[2]"
    case '1'
        read -z srcstr
        set dstfile "$argv[1]"
    case 0
        showhelp
        return 2
    case '*'
        echo $yellow"You must specify a [string] and a destination [file] to write to."$normal
        showhelp
        return 2
    end

    
    set dstpath (greadlink -m -- "$dstfile"); or return 1
    set dstdir (dirname -- "$dstpath"); or return 1
    set dstname (basename -- "$dstfile"); or return 1
    set tmpdir "$HOME/tmp"
    set trashdir "$HOME/.Trash"
    
    if [ "$dstdir" = "/" ]
        echo $yellow"For safety reasons, atomic write to hard drive root is not supported."$normal
        return 1
    end
    if echo "$dstfile" | command ggrep -Po '.*/$'
        echo $yellow"Destination '$dstfile' cannot be a directory."$normal
        return 1
    end
    if not validfilename "$dstname"
        echo $yellow"Cannot write, destination '$dstfile' is not a valid filename."$normal
        return 2
    end
    if not validfilename (basename "$dstdir")
        echo $yellow"Cannot write, destination path '$dstdir' contains an invalid filename."$normal
        return 2
    end
    if not test -d "$dstdir"
        echo $yellow"Cannot write, destination parent directory '$dstdir' does not exist."$normal
        return 1
    end

    mkdir -p "$tmpdir"
    if not test -w "$tmpdir"
        echo $yellow"Cannot write, temporary file directory '$tmpdir' is not writable."$normal
        return 1
    end
    if test -n "$_flag_nonunique"
        set tmpfile "$tmpdir/$dstname"
        set trashfile "$trashdir/$dstname"
    else
        set tmpuuid (date "+%s").(uuidgen | cut -d '-' -f1)
        set trashuuid (date "+%s").(uuidgen | cut -d '-' -f1)
        set tmpfile "$tmpdir/$dstname.$tmpuuid"
        set trashfile "$trashdir/$dstname.$trashuuid"
    end

    if not test -n "$_flag_notrash"
        mkdir -p "$trashdir"
        if not test -w "$trashdir"
            echo $yellow"Cannot write, trash directory '$trashdir' is not writable."$normal
            return 1
        end
    end

    if test -n "$_flag_dryrun"
        echo "srcstr=$srcstr"
        echo "tmpfile=$tmpfile"
        echo "trashfile=$trashfile"
        echo "dstfile=$dstfile"
        echo "dstpath=$dstpath"
        echo "dstdir=$dstdir"
        echo "dstname=$dstname"
        return 0
    end

    if not echo "$srcstr" > "$tmpfile"
        echo $yellow"Failed to create temp file $tmpfile."$normal
        return 2
    end

    if not test -n "$_flag_notrash"
        # back up existing file/dir at destination to trash
        
        cp -p -R -f "$dstpath" "$trashfile"
        or begin
            echo $red"Failed to copy existing destination file '$dstpath' to trash '$trashfile'."$normal
            return 1
        end
        and rm -Rf "$dstpath"
        or begin
            echo $red"Failed to remove existing file/directory at '$dstpath'."$normal
            return 1
        end
        or return 1
    end

    and mv -f "$tmpfile" "$dstpath"
    or begin
        echo $red"Failed to write, could not move temp file '$tmpfile' to '$dstpath'."$normal
        if test -n "$_flag_notrash"
            echo "-x was passed, so no backup was made of the destination file '$$dstpath' before attempting to write."
        else
            echo "A backup of '$$dstpath' can be found at '$trashfile'."
        end
        return 1
    end
end
