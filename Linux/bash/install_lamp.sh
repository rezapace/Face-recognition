#!/bin/bash

# Langkah 1: Instalasi Apache
sudo apt-get update
sudo apt-get install apache2
sudo apt-get install php libapache2-mod-php
cd /var/www/html/
# Mengubah kepemilikan direktori web root ke pengguna "thecodeholic"
sudo chown -R thecodeholic:thecodeholic .

# Langkah 2: Instalasi MySQL Server
sudo apt-get install mysql-server
# Masuk ke MySQL sebagai root dan mengubah password root
sudo mysql -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'p';"
# Menonaktifkan plugin validasi password MySQL
sudo mysql -u root -p -e "SET GLOBAL validate_password_length = 0;"
sudo mysql -u root -p -e "SET GLOBAL validate_password_mixed_case_count = 0;"
sudo mysql -u root -p -e "SET GLOBAL validate_password_number_count = 0;"
sudo mysql -u root -p -e "SET GLOBAL validate_password_policy = 0;"
sudo mysql -u root -p -e "SET GLOBAL validate_password_special_char_count = 0;"

# Langkah 3: Instalasi phpMyAdmin
sudo apt-get install phpmyadmin
# Ikuti panduan instalasi phpMyAdmin, pastikan mengonfigurasi dengan benar.
