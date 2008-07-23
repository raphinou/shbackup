#!/bin/bash
# This needs a ~/.pgpass file with content similar to:
# *:*:*:postgres:password
# see http://www.postgresql.org/docs/8.1/interactive/libpq-pgpass.html

. ./backup_vars.sh

$postgresql_dir/bin/pg_dumpall -U postgres  > $backup_dir/postgresql_databases.sql

