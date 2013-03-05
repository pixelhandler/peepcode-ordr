# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise64-ruby-1.9.3-p194"
  config.vm.box_url = "https://dl.dropbox.com/u/14292474/vagrantboxes/precise64-ruby-1.9.3-p194.box"

  config.vm.network :hostonly, '192.168.10.220'
  # vagrant-hostmaster
  config.vm.host_name = "ordr.vagrant"

  config.ssh.forward_agent = true
  config.vm.forward_port 9292, 9292

  config.vm.customize ["modifyvm", :id, "--memory", 1024]
  config.vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/bin", "1"]
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/public", "1"]
  config.vm.share_folder "public", "/var/www", ".", :group => "www-data", :extra => "dmode=775,fmode=664"
  nfs_setting = RUBY_PLATFORM =~ /darwin/ ? true : false
  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => nfs_setting)

  # Necessary for SSH to work with forward_agent
  config.vm.provision :shell, :inline => "echo 'Defaults env_keep+=\"SSH_AUTH_SOCK\"' >> /etc/sudoers"
  # We need a javascript runtime to build ember.js with rake
  # and phantomjs to execute test suite.
  #
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "build-essential"
    chef.add_recipe "nodejs::install_from_source"
    chef.add_recipe "phantomjs"
    chef.add_recipe "vim"
    chef.add_recipe "ack-grep"
    #chef.add_recipe "mongodb"
    chef.add_recipe "deployd"
  end
end
