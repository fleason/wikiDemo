#!/bin/bash
# This script is uploaded to the Server and then is executed from there.

sudo chage -M 99999 cloud

read -p "If you try to open 208.39.112.185 you will get an error."

sudo apt-get update
sudo apt-get -y install apache2

sudo sed -i -e "s/80/80/g" /etc/apache2/sites-available/default
sudo sed -i -e "s/80/80/g" /etc/apache2/ports.conf

sudo /etc/init.d/apache2 restart

sudo apt-get -y install vim wget php5

read -p "If you open 208.39.112.185 you will see that apache has been installed."

while true; do
	read -p "Do you want to update VMware Tools?  Remember to mount VMware Tools CD Rom.  (Y/N) " yn
	case $yn in
		[Yy]* ) 
			sudo apt-get -y install gcc make;
			sudo mount -t iso9660 /dev/cdrom /mnt;
			sudo tar zxvf /mnt/VMwareTools*;
			sudo ./vmware-tools-distrib/vmware-install.pl -d;
			break;;
		[Nn]* ) break;;
		* ) echo "Please answer y or n.";;
	esac
done

read -p "Now get wiki software.  Hit Enter."

wget http://pmwiki.org/pub/pmwiki/pmwiki-2.2.79.tgz

tar zxvf pmwiki-2.2.79.tgz

sudo chmod 2777 /var/www
sudo mv pmwiki-2.2.79 /var/www/wiki
sudo chmod 2777 /var/www/wiki
sudo mkdir /var/www/wiki/wiki.d
sudo chmod 777 /var/www/wiki/wiki.d

read -p "Now open http://208.39.112.185/wiki/pmwiki.php with browser.  Hit Enter. "

sudo cp /var/www/wiki/docs/sample-config.php /var/www/wiki/local/config.php

sudo patch /var/www/wiki/local/config.php diffconfig.patch

sudo cp index.php /var/www
sudo rm /var/www/index.html

read -p "Now open http://208.39.112.185 and edit the wiki."


