#/bin/bash 
# Hello my name is techdoc and i am the author of this script
# this script uses the GPL3 license
# what this script does is that it installs all the programs
# that i use in fedora 
# and removes some of the programs
# Init 




FILE="/tmp/out.$$"
GREP="/bin/grep"
#....

# Make sure the user runs this script as root 

if [ "$(id -u)" != "0" ]; then
	echo "This script must be ran as root"
	echo "using sudo"
	exit 1

fi

# ...





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

dnf install $(cat /home/"$USERNAME"/Downloads/fedora/plugins.txt)

# This here installs the dependencies for fonts from the font.txt file 
dnf install $(cat /home/"$USERNAME"/Downloads/fedora/font.txt) 

# This here installs other fonts to your system 
rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm


# This installs all the format media from the mm.txt file
cat /home/"$USERNAME"/fedora/project/mm.txt | xargs dnf install 


# This here installs lame from lame.txt 
dnf -y install lame\* --exclude=lame-devel

# this upgrades the media 
dnf group upgrade --with-optional Multimedia

# the two other piceses of code adds brave to your system 
dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# this here installs all my packages from pkg.txt 

dnf install $(cat /home/"$USERNAME"/Downloads/fedora/pkg.txt)
# this shows the user what packages are being uninstalled
cat remove.txt

# this asks the user if they want to remove the following packages by
# typing yes or no if they type no it will exit the script if they type yes
# it will excecute remove the packages from the list 



while true;do 
	read -p "Do you want to remove the following packages?" yn
	case $yn in
		[Yy]*)make install; break;;
		[Nn]*)exit;;
		*) echo "please answer yes or no." ;;
	esac
done
# this removes the packages from the fedora when the command is excecuted
dnf -y remove $(cat /home/"$USERNAME"/Downloads/fedora/remove.txt)
# this well remove any uneccsary packages
dnf autoremove
# this exits out of the script 
exit 

dnf remove $(cat /home/"$USERNAME"/Downloads/fedora/remove.txt


