#!/bin/sh
# this need s3sync: gem install s3sync

. ./backup_vars.sh
s3cmd  --ssl put $s3_bucket:$s3_prefix/$server.$date.tar.bz2  $backup_base/$server.$date.tar.bz2 
