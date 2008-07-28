#!/bin/bash

. ./backup_vars.sh


vservers=$(/usr/sbin/vserver-stat | /usr/bin/awk '$1!="0" && NR>1  { print $8 }')



for vserver in $vservers; do
        backup_file=$(find /etc/vservers/${vserver}/vdir/data/backup -maxdepth 1 -type f)
        [[ -n $backup_file ]] &&  cp $backup_file $backup_base
done
