#!/bin/sh

. ./backup_vars.sh


dpkg --get-selections > $backup_dir/debian-packages

