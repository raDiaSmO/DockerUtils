#!/bin/bash
for dir in ./*/; do
        cd $dir && docker compose pull && docker compose up -d
done
