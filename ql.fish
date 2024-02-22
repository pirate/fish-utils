function ql -d 'QuickLook a file or directory'
    # Updated based on https://gist.github.com/chockenberry/13c15466417b88e40f23e58df8091dac
    if set --query argv[1]
        qlmanage -p $argv >/dev/null 2>/dev/null
    else
        set --local root (mktemp -d)
        command cat >$root/ql.stdin
        set --local mime_type (file --brief --mime-type $root/ql.stdin)
        set --local extension (grep $mime_type /etc/apache2/mime.types | awk '{ print $2; }')

        if test -z $extension
            qlmanage -p $root/ql.stdin >/dev/null 2>/dev/null
        else
            mv $root/ql.{stdin,$extension}
            qlmanage -p $root/ql.$extension >/dev/null 2>/dev/null
        end
    end
end
