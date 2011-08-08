#!/bin/bash

. ./backup_vars.sh


vservers=$(/usr/sbin/vserver-stat | /usr/bin/awk '$1!="0" && NR>1  { print $8 }')



for vserver in $vservers; do
        backup_file=$(find /etc/vservers/${vserver}/vdir/data/backup -maxdepth 1 -type f)
        [[ -n $backup_file ]] &&  cp $backup_file $backup_base

        # save the mysql dump seperately, easier to catch errors
        database_dump=$(find /etc/vservers/${vserver}/vdir/data/backup -maxdepth 3 -type f -name mysql_databases.sql)
        [[ -n $database_dump ]] &&  gzip -c $database_dump > $backup_base/${vserver}_mysql_databases_${date}.sql.gz

        # save the postgresql dump seperately, easier to catch errors
        database_dump=$(find /etc/vservers/${vserver}/vdir/data/backup -maxdepth 3 -type f -name postgresql_databases.sql)
        [[ -n $database_dump ]] &&  gzip -c $database_dump > $backup_base/${vserver}_postgresql_databases_${date}.sql.gz

done
