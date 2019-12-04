#!/bin/bash
# Based on https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04
# Run sudo ./nginx.sh <your-domain-name> (without www)
sudo apt update
sudo apt install nginx
echo "Installed nginx"
sudo ufw allow 'Nginx HTTP'
echo "Allowed Nginx HTTP"
sudo mkdir -p /var/www/$1/html
sudo chown -R $USER:$USER /var/www/$1/html
sudo chmod -R 755 /var/www/$1
echo "<html>
    <head>
        <title>Welcome to $1!</title>
    </head>
    <body>
        <h1>Success!  The $1 server block is working!</h1>
    </body>
</html>" >> /var/www/$1/html/index.html
echo "server {
        listen 80;
        listen [::]:80;

        root /var/www/$1/html;
        index index.html index.htm index.nginx-debian.html;

        server_name $1 www.$1;

        location / {
                try_files $uri $uri/ =404;
        }
}"
sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/
sudo sed -i 's/# server_names_hash_bucket_size 64;/server_names_hash_bucket_size 64;/g' /etc/nginx/nginx.conf
echo "Checking for nginx errors"
sudo nginx -t
echo "Restarting nginx"
sudo systemctl restart nginx
echo "Try opening $1 now to see if the nginx setup was successful"