#!/bin/bash
# install apache and php5
sudo apt-get -y install apache2
sudo apt-get -y install php5
sudo apt-get -y install libapache2-mod-php5
sudo apt-get -y install php5-curl

# install mysql
sudo apt-get -y install mysql-server
sudo apt-get -y install libapache-mod-auth-mysql
sudo apt-get -y install php5-mysql

# install mcrypt PHP extension
sudo apt-get -y install php5-mcrypt

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
