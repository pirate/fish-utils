function destroydeploy --description 'Reset production DB and deploy current branch'
    echo $red"[X] Destroying production DB in 3sec..."$normal
    sleep 3
    ssh blitzka "killall python; sudo -u postgres dropdb grater; sudo -u postgres createdb grater"
    echo $red"["$green"√"$red"] Destoryed DB grater."$normal
    deploy $argv
end
