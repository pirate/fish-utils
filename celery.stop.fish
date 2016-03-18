function celery.stop
    for p in (pid "celery worker")
        k $p
    end
end
