#!/bin/bash
commands=('snap remove docker' 'rm -R /var/lib/docker' 'apt-get remove docker docker-engine docker.io containerd runc')
for command in "${commands[@]}"; do
        $command 2> /dev/null
done

mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update && apt-get upgrade -y && apt-get install ca-certificates docker-ce docker-ce-cli containerd.io docker-compose-plugin -y && systemctl restart docker && timedatectl set-timezone America/Toronto && timedatectl set-ntp on
