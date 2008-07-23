#!/bin/bash
# I am noa mysql user ;-)

. ./backup_vars.sh
/usr/bin/mysqldump --password=yourpass --all-databases  > $backup_dir/mysql_databases.sql
