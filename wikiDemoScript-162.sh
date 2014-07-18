!/bin/bash
# This script is uploaded to the Server and then is executed from there.

sudo chage -M 99999 cloud

echo "If you try to open 209.251.181.162 you will get an error."

sudo apt-get update
sudo apt-get -y install apache2
sudo apt-get -y install vim gcc make wget php5

echo "Now if you open 209.251.181.162 you see apache has been installed."

read

while true; do
	read -p "Do you want to update VMware Tools?  Remember to mount VMware Tools CD Rom.  (Y/N) " yn
	case $yn in
		[Yy]* ) 
			sudo mount -t iso9660 /dev/cdrom /mnt;
			sudo tar zxvf /mnt/VMwareTools*;
			sudo ./vmware-tools-distrib/vmware-install.pl -d;
			break;;
		[Nn]* ) break;;
		* ) echo "Please andwer y or n.";;
	esac
done

echo "Now get wiki software.  Hit Enter."

read

wget http://pmwiki.org/pub/pmwiki/pmwiki-2.2.65.tgz

tar zxvf pmwiki-2.2.65.tgz

sudo chmod 2777 /var/www
sudo mv pmwiki-2.2.65 /var/www/wiki
sudo chmod 2777 /var/www/wiki
sudo mkdir /var/www/wiki/wiki.d
sudo chmod 777 /var/www/wiki/wiki.d

echo "Now open http://209.251.181.162/wiki/pmwiki.php with browser.  Hit Enter. "

read

sudo cp /var/www/wiki/docs/sample-config.php /var/www/wiki/local/config.php

sudo patch /var/www/wiki/local/config.php diffconfig-162.patch

sudo cp index.php /var/www
sudo rm /var/www/index.html

echo "Now open your browser to 209.251.181.162  Hit edit and add some content."
read


