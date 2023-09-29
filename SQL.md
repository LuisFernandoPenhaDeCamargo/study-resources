# SQL.

- `SELECT db_version FROM settings`;
- `ALTER TABLE settings ADD COLUMN db_version BIGINT NOT NULL DEFAULT 0`;
- `UPDATE settings SET id = 0`.