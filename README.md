Postgres DumpAll with Rclone
================

Docker image with pg_dumpall and rclone running as a cron task. Published to sogajeffrey/pg-backup-rclone

## Usage

Attach a target postgres container to this container and mount a volume to container's `/dump` folder. Backups will appear in this volume. Optionally set up cron job schedule (default is `0 1 * * *` - runs every day at 1:00 am).

## Environment Variables:
| Variable | Required? | Default | Description |
| -------- |:--------- |:------- |:----------- |
| `PGUSER` | Required | postgres | The user for accessing the database |
| `PGPASSWORD` | Optional | `None` | The password for accessing the database |
| `PGHOST` | Optional | db | The hostname of the database |
| `PGPORT` | Optional | `5432` | The port for the database |
| `CRON_SCHEDULE` | Required | 0 1 * * * | The cron schedule at which to run the pg_dumpall |
| `DELETE_OLDER_THAN` | Optional | `None` | Optionally, delete files older than `DELETE_OLDER_THAN` (s,m,d,y). Eg: 1d - one day |
| `RCLONE_REMOTE` | Required | `None` | The configured rclone remote mounted from /root |
| `RCLONE_PATH` | Required | `None` | Path in your rclone backup target. Do not put trailing / |




