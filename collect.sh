#!/bin/sh

. ./backup_vars.sh
/bin/tar jcvf $backup_base/$server.$date.tar.bz2 $backup_dir
