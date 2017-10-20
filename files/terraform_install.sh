#!/bin/bash

# Slightly modified version of https://raw.githubusercontent.com/ryanmaclean/awful-bash-scripts/master/install_recent_terraform_packer.sh

# Get URLs for most recent versions
terraform_url=$(curl --silent https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')
packer_url=$(curl --silent https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "linux.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')

# Create a move into directory.

mkdir /opt/packer
mkdir /opt/terraform && cd $_

# Chjange directory to Terraform directory

cd /opt/terraform

# Download Terraform. URI: https://www.terraform.io/downloads.html
curl -o terraform.zip $terraform_url
# Unzip and install
unzip terraform.zip

# Change directory to Packer
cd /opt/packer

# Download Packer. URI: https://www.packer.io/downloads.html
curl -o packer.zip $packer_url
# Unzip and install
unzip packer.zip

echo '
# Terraform & Packer Paths.
export PATH=/opt/terraform/:/opt/packer/:$PATH
' >>/root/.bash_profile

echo '
# Terraform & Packer Paths.
export PATH=/opt/terraform/:/opt/packer/:$PATH
' >> /home/$USER/.bash_profile

source /home/$USER/.bash_profile
source /root/.bash_profile
