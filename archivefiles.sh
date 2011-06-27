#!/bin/bash

. ./backup_vars.sh
directories_to_archive="/etc /var/www /usr/local/bin /home/planet"
if [[ -f archive_excluded.txt ]] ; then
  exclusion = "-X archive_excluded.txt" ;
fi

/bin/tar $exclusion -jcf $backup_dir/files.tar.bz2 $directories_to_archive

