#!/bin/bash
input_file=$1
commands=('s/pm.max_children = 5/pm.max_children = ${PM.MAX_CHILDREN}/g w /dev/stdout'
's/pm.start_servers = 2/pm.start_servers = ${PM.START_SERVERS}/g w /dev/stdout'
's/pm.min_spare_servers = 1/pm.min_spare_servers = ${PM.MIN_SPARE_SERVERS}/g w /dev/stdout'
's/pm.max_spare_servers = 3/pm.max_spare_servers = ${PM.MAX_SPARE_SERVERS}/g w /dev/stdout')

for i in "${commands[@]}"; do
        if [[ $(sed -i "$i" $input_file) ]]; then
                echo "$i"
        else
                echo "error"
                exit 1
        fi
done