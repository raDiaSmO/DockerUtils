#!/bin/bash
sudo docker-compose down
sudo docker container prune -f
sudo docker network prune -f
