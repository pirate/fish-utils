function celery.start
    echo $green"[+] Starting Celery..."$normal
    psax "celery" | grep -v 'fish -c'; and return
    fork "g; vf activate grater; celery -A grater worker -l info"
    sleep 1
    psax "celery" | grep -v 'fish -c'
end
