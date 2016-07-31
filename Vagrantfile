# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "phase2/centos-7"
  config.ssh.forward_agent = true
  config.vm.network :private_network, ip: "172.28.200.10", :netmask => "255.255.0.0"
  config.vm.hostname = "awsmgr.vm"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", "2"]
    v.customize ["modifyvm", :id, "--name", "awsmgr.vm"]
  end

  config.vm.provision "shell", path: "provision.sh"
end
