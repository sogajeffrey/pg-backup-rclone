#!/bin/bash

set -e

echo "Job started: $(date)"

if [[ -z "${PREFIX}" ]]; then
  PREFIX=dump
fi

if [[ -z "${PGUSER}" ]]; then
  PGUSER=postgres
fi

if [[ -z "${PGPASSWORD}" ]]; then
  PGPASSWORD=postgres
fi

if [[ -z "${PGHOST}" ]]; then
  PGHOST=localhost
fi

if [[ -z "${PGPORT}" ]]; then
  PGPORT=5432
fi

if [[ -z "${RCLONE_REMOTE}" ]] || [[ -z "${RCLONE_PATH}" ]]; then
  echo "RCLONE_REMOTE and RCLONE_PATH must be set"
  exit 1
fi

if [[ ! -f "$RCLONE_CONF" ]]; then
    echo "Please mount the /root folder which contains /root/.config/rclone/rclone.conf"
	exit 1
fi

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/dump/$PREFIX-$DATE.sql"
RCLONE_CONF=/root/.config/rclone/rclone.conf

pg_dumpall -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -f "$FILE" 
gzip "$FILE"

rclone move ${FILE}.gz ${RCLONE_REMOTE}:${RCLONE_PATH}/

if [ ! -z "$DELETE_OLDER_THAN" ]; then
	rclone delete ${RCLONE_REMOTE}:${RCLONE_PATH}/ --min-age ${DELETE_OLDER_THAN}
fi

echo "Job finished: $(date)"
