vagrant-centos project CHANGELOG
============================

This file is used to list changes made in each version of the vagrant-centos project.

## [1.0.0] - 2017-04-01
### Initial commit. System almost ready for use

## [2.0.0] - 2017-10-19
### Generalizations

## [3.0.0] - 2017-10-20
### Disabled synchronization for  the host and guest folders due to the issues with using rsync and virtualbox type of sync.
### Removed rvm
### Now you can setup the name of VM
### You can pin the exact version of the centos/7 box
### Removed some unnecessary if conditional checks
### New version of chefdk is added
### New packages are installed
### Run dos2unix against .bashrc files at the end
### Some cosmetic changes
### Added Terraform and Packer installation

## [3.0.1] - 2017-10-20
### Added curl

## [3.0.2] - 2017-10-23
### Added kernel-develop

## [3.0.3] - 2017-10-23
### Added google-chrome and some monitoring tools

## [3.0.4] - 2017-10-26
### Added Ansible and related tools to the installation
