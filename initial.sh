#!/bin/bash
# Script for https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04
# Login with ssh root@<your-ip>
# Run ./initial.sh <user-name>
adduser $1
echo "Added user $1"
usermod -aG sudo $1
echo "Gave sudo permissions to $1"
ufw allow OpenSSH
ufw enable
echo "Enabled OpenSSH on the firewall"
rsync --archive --chown=$1:$1 ~/.ssh /home/$1
echo "Added root public ssh key to user $1"