# Peepcode Ember.js Ordr app

See: <https://peepcode.com/products/emberjs>


## Build Tools

* Uses [rake-pipeline-web-filters](https://github.com/wycats/rake-pipeline-web-filters), for setup info see [stackoverflow](http://stackoverflow.com/a/8565483/775246)
* See the [Assetfile](Assetfile) for details of the build and links to docs
* Uses Minispade for dependency management see [comments in minispade source](https://github.com/wycats/rake-pipeline-web-filters/blob/master/lib/rake-pipeline-web-filters/minispade_filter.rb)


## Directories

**Application**

* [app](app) - your application files
* [tmp](tmp) - used by build tools
* [public](public) - used as destination of build tools

**System**

* [cookbooks](cookbooks) - has [chef](http://www.opscode.com/chef/) recipes for building a virtual box using vagrant
* [dotfiles](dotfiles) - can be used to setup a virtual box using vagrant
* [bin](bin) - has some shell scripts and is used by the build tools for executables e.g. `bin/rakep build` or `bin/rakep server`


## VirtualBox / Vagrant

* Box used: `precise64-ruby-1.9.3-p194`, same as Ember.js project
* Uses an IP of 192.168.10.220, change if you like, this can be used to view the Ordr app with <http://192.168.10.220:9292>
* The host name is `ordr.vagrant` to use that you will need to add an entry to your hosts file `192.168.10.220 ordr.vagrant` (local, not guest box); then you can use <http://ordr.vagrant:9292>
* See [Vagrantfile](Vagrantfile) for more details


### Setup

This list of commands descirbes how to setup a [Oracle’s VirtualBox](https://www.virtualbox.org/wiki/Downloads) using [Vagrant](http://docs.vagrantup.com/v1/docs/getting-started/). The [cookbooks](cookbooks) are submodules used by [chef_solo](http://docs.vagrantup.com/v1/docs/provisioners/chef_solo.html) to provision a virtual box. The box used in the [Vagrantfile](Vagrantfile) is a linux precise64 box configured with ruby-1.9.3-p194. The root (sudo) password for the virtual box is `vagrant`. Also can connect to the box using `vagrant ssh`; this will be the `vagrant` user on the box.

The provision script uses shared folders so the repo on your host system is the same inside the guest box at `/vagrant` as well as `var/www`

	git submodule init
	vagrant up
	vagrant ssh
	cd /vagrant
	sudo bundle install
	./bin/rakep build
	./bin/rakep server

#### Extras

* [bin/z-config.sh](bin/z-config.sh) configures [z](https://github.com/rupa/z)
* [bin/vim-config.sh](bin/vim-config.sh) will setup up vim with IDE like tools see repo [pixelhandler/vim-config](https://github.com/pixelhandler/vim-config) 
* [bin/jsctags.sh](bin/jsctags.sh) configures [jsctags](https://github.com/mozilla/doctorjs), a ctags-compatible code indexing solution for JavaScript
* [bin/dotfiles.sh](bin/dotfiles.sh) will copy the `dotfiles` folder contents into your vagrant box. If you put your ssh keys, e.g. id_rsa for github, into the [dotfiles/.ssh](dotfiles/.ssh) directory the keys will be copied there as well.

Execute the scripts in the /vagrant/bin directory after provisioning the VirtualBox with vagrant and connecting using `vagrant ssh`

	vagrant ssh
	cd /vagrant/bin
	./dotfiles.sh
	sudo ./z-config.sh
	sudo ./jsctags.sh
	./vim-config.sh
	. ~/.bash_profile
