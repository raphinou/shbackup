#!/bin/sh

. ./backup_vars.sh

/usr/bin/gem list > $backup_dir/gems-list

