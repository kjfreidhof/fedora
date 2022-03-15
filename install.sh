#/bin/bash 

while true;do
	read -p "Do you want to install this script?" yn
	case $yn in 
		[Yy]*)make install; break;;
		[Nn]*)exit;;
		*)echo "please answer yes or no.";;
	esac
done


sudo dnf check-update 

sudo dnf -y upgrade

cat /home/$USERNAME/Downloads/project/plugins.txt | xargs dnf -y install

sudo dnf -y install $(cat /home/$USERNAME/Downloads/projects/repo.txt)


cat /home/$USERNAME/Downloads/project/font.txt | xargs dnf install

sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

cat /home/$USERNAME/Downloads/project/mm.txt | xargs dnf install 

dnf install $(cat /home/$USERNAME/Downloads/projects/lame.txt)

sudo dnf group upgrade --with-optional Multimedia

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

cat /home/$USERNAME/Downloads/projects/pkg.txt | xargs dnf install

i



