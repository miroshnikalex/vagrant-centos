#!/bin/bash

USER="alex" # please add your user here
GROUP=$USER # change if different from user
PASSWORD="`printf '%s' $(cat /tmp/password)`"
WORKSPACE="/workspace" # place for chef repositories
GUEST_PUBLIC_KEY="guest.pub" # ssh key for connecting to your guest VM. Not required
MAIN_PRIVATE_KEY="main" # ssh key for connecting to the jump nodes. Required
GUI="GNOME" # can be KDE, GNOME if you define this variable as something else GUI will not be installed

if [[ -z $PASSWORD ]]; then
  echo "#### CRITICAL: Password is not specified. Aborting installation ####"
  exit 1
fi

if [[ -z $USER ]]; then
  echo "#### CRITICAL: User is not defined, please edit 'provision.sh' and add USER variable. Aborting installation ####"
  exit 1
else
  useradd -m -p $(printf '%s' '$PASSWORD' | openssl passwd -1 stdin) $USER
  mkdir /home/$USER/.ssh
fi

if [[ -d ./keys ]]; then
  echo "#### CRITICAL: Directory ./keys does not exist. Aborting Installation ####"
  exit 1
fi

if [[ $(stat -c "%a" /home/$USER/.ssh) != 700 ]]; then
  echo "#### INFO: Changing permissions for .ssh folder to 700 ####"
  chmod 700 /home/$USER/.ssh
else
  echo " #### INFO: Permissions are fine, nothing to do, continue... ####"
fi

if [[ -z $WORKSPACE ]]; then
  echo "#### CRITICAL: $WORKSPACE variable is not defined. Please edit 'provision.sh' and define it ####"
  exit 1
else
  mkdir $WORKSPACE
  chown -R $USER:$GROUP $WORKSPACE
fi
  sudo cp -f /tmp/.bashrc /home/$USER
  sudo cp -f /tmp/.bashrc /root
  sudo cp -f /tmp/motd /etc

if [ -f /etc/yum.repos.d/docker-ce.repo ]; then
  echo "#### INFO: Docker repositosry is already in place. Nothing to do. ####"
else
  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
fi

yum install -y epel-release
yum --enablerepo=* clean all
yum -y update

case $GUI in
  "KDE" ) yum groupinstall -y "KDE Plasma Workspaces";;
  "GNOME" ) yum groupinstall -y "GNOME Desktop";;
  * ) echo "No GUI will be installed";;
esac

sudo sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo sed -i 's/#   ForwardAgent no/ForwardAgent yes/g' /etc/ssh/ssh_config

yum groupinstall -y "Development Tools"
yum install -y git gitflow
yum install -y dos2unix
yum install -y vim
yum install -y nano
yum install -y unzip
yum install -y screen
yum install -y ruby
yum install -y mc
yum install -y traceroute
yum install -y htop
yum install -y docker
yum install -y jq
yum install -y ShellCheck
yum install -y lsb-core-noarch
if [[ $GUI == "KDE" || $GUI == "GNOME" ]]; then
  echo "#### INFO: Installing Atom editor ####"
  rpm -ihv https://atom.io/download/rpm
  apm install --packages-file /tmp/packagelist.atom
else
  echo "INFO: #### GUI is not installed, Atom can't be installed ####"
fi
rpm -ivh https://packages.chef.io/files/stable/chefdk/1.2.22/el/7/chefdk-1.2.22-1.el7.x86_64.rpm
yum install -y gpg2
yum install -y terminator
yum install -y python-pip
yum install -y npm
pip install --upgrade pip
pip install awscli
npm install azure-cli -g
curl -sSL https://rvm.io/mpapis.asc | sudo gpg2 --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby
source /usr/local/rvm/scripts/rvm
chkconfig docker on
systemctl start docker
if [[ $GUI == "KDE" || $GUI == "GNOME" ]]; then
  echo "#### INFO: Setting GUI mode as default ####"
  systemctl set-default graphical.target
else
  echo "INFO: #### GUI is not installed, use CLI ####"
fi
yum update -y
echo "INFO: #### Cleaning Up! ####"
rm -f /tmp/password
rm -f /tmp/motd
rm -f /tmp/.bashrc

echo "INFO: ####   Rebooting system to apply all changes   ####"
shutdown -r now
