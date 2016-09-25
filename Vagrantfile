# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.8.5'

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.box_check_update = true
  config.vm.network :private_network, ip:  "192.168.33.10"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.synced_folder ".", "/vagrant", :mount_options => ['dmode=755', 'fmode=644']

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provision/playbook.yml"
  end

  if File.exists?(File.join(File.dirname(__FILE__), 'provision-post.yml')) then
    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "provision-post.yml"
    end
  end

  if File.exists?(File.join(File.dirname(__FILE__), 'provision-post.sh')) then
    config.vm.provision :shell, :path => File.join( File.dirname(__FILE__), 'provision-post.sh' )
  end
end
