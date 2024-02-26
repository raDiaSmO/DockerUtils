#!/bin/bash
commands=('docker compose down' 'docker container prune -f' 'docker network prune -f' 'docker builder prune -f')
for dir in ./*/; do
        cd $dir
        for command in "${commands[@]}"; do
                $command 2> /dev/null
        done
done
