#!/bin/bash 

echo "run this script at your own risk"
echo "i am not reponsible for what happens to your system"
echo "when you install this script it is"
echo "beta"

while true;do 
	read -p "Do you want to install this script?" yn
	case $yn in 
		[Yy]*)make install; break;;
		[Nn]*)exit;;
		*)echo "please answer yes or no.";;
	esac
done

sudo dnf check-update 

sudo dnf upgrade

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

 sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

exit 
