# Dependencies:
#     - postgres: pg_dump, psql, createdb, dropdb
#     - postgresql.start
#     - quiet
#     - pv (pipeviewer)

function pull_dev_db --description 'Overwrite local postgres db with updated copy from remote'

    set -l REMOTE_DB_NAME 'bg'
    set -l LOCAL_DB_NAME 'mavrx'
    set -l BACKUP_DB_NAME 'mavrx_old'
    set -l TEMP_DB_NAME 'mavrx_downloaded'
    set -l DOWNLOAD_LOCATION ~/tmp/"$TEMP_DB_NAME".sql


    echo "[1/6] Downloading database `$REMOTE_DB_NAME` from AWS dev"
        mkdir -p (dirname $DOWNLOAD_LOCATION)
        quiet 'command rm $DOWNLOAD_LOCATION'
        pg_dump -h pgdev.ccuddobdp8d5.us-east-1.rds.amazonaws.com -p 5432 -U mavrx bg | pv > $DOWNLOAD_LOCATION
        test -e $DOWNLOAD_LOCATION; or return 1

    echo "[2/6] Creating temp db `$TEMP_DB_NAME` for import"
        postgresql.start
        dropdb $TEMP_DB_NAME
        createdb $TEMP_DB_NAME

    echo "[3/6] Importing downloaded db into `$TEMP_DB_NAME`"
        psql $TEMP_DB_NAME < $DOWNLOAD_LOCATION
        and command rm $DOWNLOAD_LOCATION

    echo "[4/6] Disconnecting db sessions to perform `$LOCAL_DB_NAME` db move"
        psql postgres -c "SELECT pg_terminate_backend(pid) from pg_stat_activity where datname = '$LOCAL_DB_NAME'"

    echo "[5/6] Moving old local db `$LOCAL_DB_NAME` to `$BACKUP_DB_NAME`"
        quiet dropdb $BACKUP_DB_NAME
        psql postgres -c "ALTER DATABASE $LOCAL_DB_NAME RENAME TO $BACKUP_DB_NAME"

    echo "[6/6] Moving new db `$TEMP_DB_NAME` into place: `$LOCAL_DB_NAME`"
        psql postgres -c "ALTER DATABASE $TEMP_DB_NAME RENAME TO $LOCAL_DB_NAME"

    echo "[√] Done! Now connect to your new updated db: $LOCAL_DB_NAME"
end
