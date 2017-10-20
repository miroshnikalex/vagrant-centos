# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "centos/7"
  config.vm.box_version = "1706.02"
  config.vbguest.auto_update = true
  config.vm.hostname = "vbox-centos"
  config.vm.synced_folder ".", "/vagrant", disabled: true


  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 12345

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
config.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--cpus", "2"]
     vb.customize ["modifyvm", :id, "--paravirtprovider", "default"]
     vb.customize ["modifyvm", :id, "--cpuexecutioncap", "60"]
     vb.customize ["modifyvm", :id, "--memory", "4096"]
     vb.customize ["modifyvm", :id, "--vram", "32"]
     vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
     vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
     vb.customize ["modifyvm", :id, "--usb", "on"]
end
config.vm.provider :virtualbox do |vb|
        vb.name = "vbox-centos"
end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
#config.vm.provision "chef_solo" do |chef|
#    cookbook_path = "./cookbooks/"
#    data_bags_path = "./cookbooks/data_bags"
#    chef.add_recipe "users"
#    chef.add_recipe "motd"
#    chef.add_recipe "bashrc"
#    chef.add_recipe "directories"
#end
#config.vm.provision "file",
#     source: "./keys/guest.pub",
#     destination: "/tmp/guest.pub"
#config.vm.provision "file",
#     source: "./keys/main",
#     destination: "/tmp/main"
config.vm.provision "file",
      source: "./files/terraform_install.sh",
      destination: "/tmp/terraform_install.sh"
config.vm.provision "file",
      source: "./keys/password",
      destination: "/tmp/password"
config.vm.provision "file",
     source: "./files/packagelist.atom",
     destination: "/tmp/packagelist.atom"
config.vm.provision "file",
     source: "./files/motd",
     destination: "/tmp/motd"
config.vm.provision "file",
     source: "./files/.bashrc",
     destination: "/tmp/.bashrc"
config.vm.provision "shell",
     path: "./config/provision.sh"
end
