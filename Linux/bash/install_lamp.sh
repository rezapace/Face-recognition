#!/bin/bash

# Langkah 1: Instalasi Apache
sudo apt-get update
sudo apt-get install apache2
sudo apt-get install php libapache2-mod-php
cd /var/www/html/
sudo chown thecodeholic:thecodeholic -R ./
sudo sed -i 's/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=thecodeholic/' /etc/apache2/envvars
sudo sed -i 's/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=thecodeholic/' /etc/apache2/envvars

# Langkah 2: Instalasi MySQL Server
sudo apt-get install mysql-server
sudo mysql -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'p';"
sudo mysql -u root -p -e "SET GLOBAL validate_password_length = 0;"
sudo mysql -u root -p -e "SET GLOBAL validate_password_mixed_case_count = 0;"
sudo mysql -u root -p -e "SET GLOBAL validate_password_number_count = 0;"
sudo mysql -u root -p -e "SET GLOBAL validate_password_policy = 0;"
sudo mysql -u root -p -e "SET GLOBAL validate_password_special_char_count = 0;"
sudo mysql -u root -p -e "CREATE USER 'root'@'localhost' IDENTIFIED BY 'p';"

# Langkah 3: Instalasi phpMyAdmin
sudo apt-get install phpmyadmin