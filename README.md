# Unified support workspace project

## How-to roll VM out on the Windows box:

The main goal of the project is having the unified workplace with all necessary software installed.

### Pre-requests:

- Laptop
- Vagrant
- VirtualBox
- Vagrant vbguest plugin

### Installation


* Clone git repository
* Download and install VirtualBox and extension pack: https://www.virtualbox.org/wiki/Downloads
* Download and install Vagrant: https://www.vagrantup.com/downloads.html
* Go to the cloned repository and install vbguest plugin for Vagrant: vagrant plugin install vagrant-vbguest
* Create the file ./keys/password and add the password for your VM user there.
* Change variables in the config/provision.sh accordingly
* Define variable "USER" in ./files/.bashrc using username you'd like to use
* run vagrant up

## Authors

* **Oleksandr (Alex) Miroshnyk** - Initial work and maintaining
