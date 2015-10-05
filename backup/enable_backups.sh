#!/bin/bash

BACKUP_LOG="/var/log/mysql/backup.log"

if [ -n "${CRON_TIME}" ]; then
    echo "=> Configuring cron schedule for database backups ..."
    echo "${CRON_TIME} /backup.sh >> ${BACKUP_LOG} 2>&1" > /etc/cron.d/mysql_backup

    # start cron if it's not running
    if [ ! -f /var/run/crond.pid ]; then
        exec /usr/sbin/cron -f
    fi
fi
