#!/bin/bash

. ./backup_vars.sh
directories_to_archive="/etc /var/www /usr/local/bin /home/planet"

/bin/tar -X archive_excluded.txt -jcvf $backup_dir/files.tar.bz2 $directories_to_archive

