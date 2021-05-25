#!/bin/bash

set -e

LOGFIFO='/var/log/cron.fifo'
if [[ ! -e "$LOGFIFO" ]]; then
    mkfifo "$LOGFIFO"
fi

mkdir /dump

/dump.sh

