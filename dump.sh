#!/bin/bash

set -e

echo "Job started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/dump/$PREFIX-$DATE.sql"

pg_dumpall -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -f "$FILE" 
gzip "$FILE"

rclone move ${FILE}.gz ${RCLONE_REMOTE}:${RCLONE_PATH}/

if [ ! -z "$DELETE_OLDER_THAN" ]; then
	rclone delete ${RCLONE_REMOTE}:${RCLONE_PATH}/ --min-age ${DELETE_OLDER_THAN}
fi

echo "Job finished: $(date)"
