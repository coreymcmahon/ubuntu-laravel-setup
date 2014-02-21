#!/bin/bash
sudo apt-get update

# install apache and php5
sudo apt-get -y install apache2
sudo apt-get -y install php5
sudo apt-get -y install libapache2-mod-php5
sudo apt-get -y install php5-curl
sudo apt-get -y install php5-json

# install mysql
sudo apt-get -y install mysql-server
sudo apt-get -y install libapache-mod-auth-mysql
sudo apt-get -y install php5-mysql

# install mcrypt PHP extension
sudo apt-get -y install mcrypt php5-mcrypt
sudo ln -s /etc/php5/conf.d/mcrypt.ini /etc/php5/mods-available
sudo php5enmod mcrypt
sudo service apache2 restart

# enable mod_rewrite
sudo a2enmod rewrite

# restart apache
sudo /etc/init.d/apache2 restart

# install composer
cd ~
curl -s http://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# misc.
sudo apt-get -y install git

# ssl
sudo a2enmod ssl
sudo a2ensite default-ssl
sudo /etc/init.d/apache2 restart

# add swap
sudo dd if=/dev/zero of=/swapfile bs=1M count=1024
sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
sudo mkswap /swapfile
sudo swapon /swapfile
