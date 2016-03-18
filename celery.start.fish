function celery.start
    echo "Starting Celery..."
    psax "celery worker" | grep -v "fish -c"; and return
    fork "manage celery worker --loglevel=INFO --concurrency=1 --purge --queues celery,bulk,fast"
    sleep 1
    psax "celery worker" | grep -v "fish -c"
end
