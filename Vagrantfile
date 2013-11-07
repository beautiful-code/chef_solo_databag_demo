# -*- mode: ruby -*-
# vi: set ft=ruby :

# Use 10.123.61.0/24 for allocating local private IPs

Vagrant.configure("2") do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest


  config.vm.provider :virtualbox do |provider|
    provider.customize ["modifyvm", :id, "--memory", "1100"]
    config.vm.box = "ubuntu-precise-12.04.3-lts"
    config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  end


  config.vm.define :demo_node do |node|
    node.vm.network :private_network, ip: "10.123.61.36"
    node.vm.provision :chef_solo do |chef|
      chef.cookbooks_path    = 'cookbooks'
      chef.log_level         = :debug
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"
      chef.encrypted_data_bag_secret_key_path= "/Users/ravibhim/.ssh/id_rsa"
      #chef.encrypted_data_bag_secret= "/tmp/mykey"

      chef.add_role "test"
    end
  end


end
