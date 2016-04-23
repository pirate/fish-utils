function celery.start
    echo "Starting Celery..."
    psax "celery" | grep -v 'fish -c'; and return
    fork "cd ~/mavrx/FOCS; vf activate focs3; make celery"
    # fork "manage celery worker --loglevel=INFO --concurrency=1 --purge --queues celery,bulk,fast"
    sleep 1
    psax "celery" | grep -v 'fish -c'
end
