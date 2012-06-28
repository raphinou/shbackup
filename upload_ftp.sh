#!/bin/bash

. ./backup_vars.sh
lftp -u $ftp_user,$ftp_pass  -e "mput $backup_base/*enc   /; mrm *$(date +%Y%m%d  --date="-12days")* ; exit" $ftp_host

#uncomment if to only upload once a week
#if  [[ $(date +%w) -eq 3 ]] ; then
  cd $backup_base
  # split files if bigger than 4Gb
  for f in *enc; do
    if [[ $(stat --format %s $f) -gt 4294967296 ]] ; then
      echo "splitting $f"
      split -b 2000M $f $f.splitted.
      rm $f
    fi
  done
  # upload files
  for f in *tar.bz2.enc*; do
    echo "uploading $f"
    s3cmd --no-progress put $f s3://ovh-backup/$(basename $f).$RANDOM
  done
#fi

