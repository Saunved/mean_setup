#!/bin/bash
# Script for https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04
# Login with ssh root@<your-ip>
# Run ./initial.sh <user-name>
adduser $1
usermod -aG sudo $1
ufw allow OpenSSH
ufw enable
rsync --archive --chown=$1:$1 ~/.ssh /home/$1