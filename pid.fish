function pid --description 'get the best guess for the pid of a process'
    psax "$argv" | awk '{print $1}'
end
