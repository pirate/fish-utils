function gcom --description 'git commit -m "$argv"'
    faketty git commit --allow-empty -m "$argv" | \
    regex 's/changed/'$green'changed/g' | \
    regex 's/insertions/'$cyan'insertions/g' | \
    regex 's/deletions/'$red'deletions/g'
end
