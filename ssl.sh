#!/bin/bash

sudo add-apt-repository ppa:certbot/certbot
echo "Added certbot repository"
wait
sudo apt install python-certbot-nginx
echo "Installed python certbot nginx"
wait
sudo ufw allow 'Nginx Full'
wait
sudo ufw delete allow 'Nginx HTTP'
echo "Allowed traffic from HTTPS only"
wait
sudo certbot --nginx -d $1
echo "Issuing certbot certificate"
wait
echo "Testing if certbot renew will work"
sudo certbot renew --dry-run