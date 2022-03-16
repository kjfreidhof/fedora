#/bin/bash 
# Hello my name is techdoc and i am the author of this script
# this script uses the GPL3 license
# what this script does is that it installs all the programs
# that i use in fedora 
# and removes some of the programs



# this is a warning message
echo "run this script at your own risk"
echo "I am not responsible for what happens to your system"
echo "when you install this script"


# this says the user accepts the risks and they want to install it
while true;do
	read -p "Do you want to install this script?" yn
	case $yn in 
		[Yy]*)make install; break;;
		[Nn]*)exit;;
		*)echo "please answer yes or no.";;
	esac
done

# This here installs the packages from the plugins.txt

sudo dnf -y install $(cat /home/"$USERNAME"/Downloads/fedora/plugins.txt)

# This here installs the dependencies for fonts from the font.txt file 
sudo dnf -y install (cat /home/"$USERNAME"/Downloads/fedora/font.txt) 

# This here installs other fonts to your system 
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm


# This installs all the format media from the mm.txt file
sudo dnf -y install (cat /home/"$USERNAME"/fedora/project/mm.txt)


# This here installs lame from lame.txt 
sudo dnf -y install $(cat /home/"$USERNAME"/Downloads/fedora/lame.txt)

# this upgrades the media 
sudo dnf group upgrade --with-optional Multimedia

# the two other piceses of code adds brave to your system 
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# this here installs all my packages from pkg.txt 

sudo dnf -y install (cat /home/"$USERNAME"/Downloads/fedora/pkg.txt)
