#!/bin/bash
# encrypts files with openssl, with the password put in file named pass
# without args: encrypts all files in $backup_base
# 1 arg: directory: encrypts all files in that directory
# 1 arg: file: encrypts that file
# Note the source files are deleted

. ./backup_vars.sh

if [[ $# == 0 ]]; then
        arg=$backup_base
else
        arg=$1
fi

if [[ -d $arg ]]; then
        echo "encrypting all files in dir $arg"
        for f in $arg/*; do
                [[ ! -f $f ]] && continue
                echo "encrypting $f"
                openssl des3 -e -in $f -out $f.enc -a -salt -kfile $scripts_dir/pass
                rm $f
        done
elif [[ -f $arg ]]; then
        echo "encrypting file $arg"
        [[ -f $arg ]] && openssl des3 -e -in $arg -out $arg.enc -a -salt -kfile $scripts_dir/pass
        rm $arg

fi

