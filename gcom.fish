function gcom --description 'git commit -m "$argv"'
    faketty git commit --allow-empty -m "$argv" | \
    regex 's/changed/'$green'changed'$normal'/g' | \
    regex 's/insertions/'$cyan'insertions'$normal'/g' | \
    regex 's/deletions/'$red'deletions'$normal'/g'
end
