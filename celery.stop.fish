function celery.stop
    for p in (pid "celery")
        k $p
    end
end
