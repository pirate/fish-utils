function deploy --description 'Deploy current branch to the grater server'
    cd ~/Code/grater-project/grater-django
    set -l git_branch (_git_branch_name)

    echo $yellow"[↑] Pushing"$normal" $git_branch to origin/live branch"
    git push origin "$git_branch":live --force

    echo $blue"[↓] Pulling"$normal" origin/live to blitzka.com"
    ssh blitzka "git remote update; \
                git branch -D temp -q; \
                git checkout -b temp -q; \
                git branch -D live -q; \
                git checkout -f live -q; \
                pip install -q -r requirements.txt"

    echo $purple"[*] Clearing"$normal" Redis, restarting Runserver..."
    ssh blitzka "killall python; \
              cd grater-django/;
              nohup ./manage.py runserver > /var/log/grater.log 2>&1 & \
              service nginx reload;"

    echo $green"[√] Done!"$normal" Visit https://blitzka.com"$normal
    # fork 'curl -s -X POST -H \'Content-type: application/json\' --data \'{"channel":"focs-dev","text":":+1: Deployed origin/'$git_branch' to https://focs-live.myfarm.ag (FOCS-LIVE).","icon_emoji":":checkered_flag:","username":"focs-live"}\' https://hooks.slack.com/services/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'
end
