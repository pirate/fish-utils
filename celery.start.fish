function celery.start
    echo "Starting Celery..."
    psax "celery" | grep -v 'fish -c'; and return
    fork "g; vf activate grater; celery -A grater worker -l info"
    sleep 1
    psax "celery" | grep -v 'fish -c'
end
