Postgres DumpAll with Rclone
================

Docker image with pg_dumpall and rclone running.  Published to sogajeffrey/pg-backup-rclone


## Environment Variables:
| Variable | Required? | Default | Description |
| -------- |:--------- |:------- |:----------- |
| `PGUSER` | Required | postgres | The user for accessing the database |
| `PGPASSWORD` | Optional | `None` | The password for accessing the database |
| `PGHOST` | Optional | db | The hostname of the database |
| `PGPORT` | Optional | `5432` | The port for the database |
| `DELETE_OLDER_THAN` | Optional | `None` | Optionally, delete files older than `DELETE_OLDER_THAN` (s,m,d,y). Eg: 1d - one day |
| `RCLONE_REMOTE` | Required | `None` | The configured rclone remote mounted from /root |
| `RCLONE_PATH` | Required | `None` | Path in your rclone backup target. Do not put trailing / |




