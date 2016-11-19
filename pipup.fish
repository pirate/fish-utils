function pipup --description 'Update a pip package.'
    set -l version (grep "version\='" < setup.py | regex 's/.*version\=\'(.*)\',$/$1/g')

    echo $cyan"[>] Starting package build for v"$version"..."$normal

    _is_git_dirty
    or begin
        echo $red"[X] Commit all changes first."$normal
        return 1
    end

    python setup.py install
    python setup.py test
    or begin
        echo $red"[X] Fix all tests first."$normal
        return 1
    end

    echo $yellow"[*] Creating distribution..."$normal
    python setup.py sdist
    python setup.py bdist_wheel

    echo $yellow"[+] Commiting build to git..."$normal
    git add .
    git commit -m "Add build for v$version"
    git push

    echo $yellow"[^] Uploading build to pypi in 3sec..."$normal
    sleep 3
    twine upload dist/*-"$version"*
    and echo $green"[√] Updated pypy package to v$version"$normal
    or echo $red"[X] Failed to update pypy package to v$version"$normal
end
