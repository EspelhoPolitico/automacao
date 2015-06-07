# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 3000, host: 3000 # Rails
  config.vm.network "forwarded_port", guest: 3306, host: 3306, auto_correct: true # MySQL

  config.omnibus.chef_version = "12.3.0"
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "espelho-politico::default"
  end    
end
