#!/bin/sh

. ./backup_vars.sh
/bin/tar jcf $backup_base/$server.$date.tar.bz2 $backup_dir
