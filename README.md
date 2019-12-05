These scripts use the DigitalOcean guides for Ubuntu 18.04 to setup a server with a sudo user, running Nginx + NodeJS with a Let's Encrypt SSL certificate, along with MongoDB (based on the official MongoDB installation guide)

Log into your server as root:  
```ssh root@<your-server-ip>```  
Clone this repository:  
```git clone https://github.com/Saunved/mean_setup.git```

## initial.sh
Perform the initial server setup. The script is written based on this guide:  
https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04

```cd mean_setup```  
```chmod +x initial.sh```  
```./initial.sh <user-name> ```  
Enter the password and other details when prompted. When this step is over, you can remove the mean_setup folder.  
```cd ~```  
```rm -rf mean_setup```
Exit from root  
```exit```

## nginx.sh
Log in as <user-name> into your server  
```ssh <user-name>@<your-server-ip>```  
Clone this repository:  
```git clone https://github.com/Saunved/mean_setup.git```
```cd mean_setup```  
```chmod +x nginx.sh```  
```sudo ./nginx.sh <your-domain-name>```