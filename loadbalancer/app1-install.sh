#! /bin/bash
#instance identity metadata reference - ht
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start
sudo echo '<h1>welcome to devops - app-1</h1>'| sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
