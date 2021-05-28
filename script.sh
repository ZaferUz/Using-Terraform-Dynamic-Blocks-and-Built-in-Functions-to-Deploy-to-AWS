#!/bin/bash
sudo yum -y install httpd
sudo yum -y install git 
sudo systemctl start httpd && sudo systemctl enable httpd
sudo sleep 45
sudo cd /var/www/html/ 
sudo git clone https://github.com/ZaferUz/my-webpage.git 
sudo cd my-webpage/ 
sudo mv * ..
