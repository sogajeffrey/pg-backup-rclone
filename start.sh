#!/bin/bash

set -e

LOGFIFO='/var/log/cron.fifo'
if [[ ! -e "$LOGFIFO" ]]; then
    mkfifo "$LOGFIFO"
fi

if [[ -z "${CRON_SCHEDULE}" ]]; then
  CRON_SCHEDULE='0 1 * * *'
fi

echo -e "$CRON_SCHEDULE /dump.sh > $LOGFIFO 2>&1" | crontab -
crontab -l
crond 
tail -f "$LOGFIFO"

