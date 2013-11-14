# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::configure("2") do |config|
    #config.vm.box = "debian-wheezy72-x64-vbox43"
    #config.vm.box_url = "https://puphpet.s3.amazonaws.com/debian-wheezy72-x64-vbox43.box"
    config.vm.hostname = "drupal.vagrant"

    config.vm.box = "centos63"
    config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"

# config.vm.network :forwarded_port, guest: 80, host: 8080
    config.vm.network :private_network, ip: "192.168.34.122"
    config.vm.synced_folder ".", "/vagrant", :nfs => true

    config.vm.provider "virtualbox" do |v|
        # v.gui = true
        v.customize ["modifyvm", :id, "--memory", 512]
    end

    config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
        chef.roles_path = "roles"
        chef.data_bags_path = "data_bags"
        chef.add_role "all"
    end
end
