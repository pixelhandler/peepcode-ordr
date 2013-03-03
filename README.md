# Peepcode Ember.js Ordr app

The **Ordr application code** is [used by permission][peepcode-ordr-tweet] from [Peepcode][peepcode]. See the [Fire up Ember.js video][peepcode-emberjs-video] page for details on the application. the Peepcode tutorial video is excellent and worth the purchase price; if you are learning [Ember.js][emberjs] then buy it. The Ordr application tackles more complexity than a todos application and also demonstrates how Ember.js works behind the scenes.


## Build Tools

* Uses [rake-pipeline-web-filters][rake-pipeline-web-filters], for setup info see [stackoverflow][stackoverflow-rake-pipeline]
* See the [Assetfile](Assetfile) for details of the build and links to docs
* Uses Minispade for dependency management see [comments in minispade source][minispade-source]

One you've run `bundle install` the build command is `bin/rakep build`; and to run a server use `bin/rakep server`. This repo has provisioning with `vagrant up` so you can use a virtual box rather than your local system if you like. See the *Setup* instructions below


## Directories

**Application**

* [/app](app) - your application files
* /tmp - added and used by build tools, ignored by .gitignore
* [/public](public) - used as destination of build tools

**System**

* [/cookbooks](cookbooks) - has [chef][chef] recipes for building a virtual box using vagrant
* [/dotfiles](dotfiles) - can be used to setup a virtual box using vagrant
* [/bin](bin) - has some shell scripts and is used by the build tools for executables e.g. `bin/rakep build` or `bin/rakep server`


## VirtualBox / Vagrant

* Box used: `precise64-ruby-1.9.3-p194`, same as Ember.js project
* Uses an IP of 192.168.10.220, change if you like, this can be used to view the Ordr app with <http://192.168.10.220:9292>
* The host name is `ordr.vagrant` to use that you will need to add an entry to your hosts file `192.168.10.220 ordr.vagrant` (local, not guest box); then you can use <http://ordr.vagrant:9292>
* See [Vagrantfile](Vagrantfile) for more details


### Setup

This list of commands descirbes how to setup a [Oracle’s VirtualBox][virtualbox] using [Vagrant][vagrant]. The [cookbooks](cookbooks) are submodules used by [chef_solo][vagrant-chef_solo] to provision a virtual box. The box used in the [Vagrantfile](Vagrantfile) is a linux precise64 box configured with ruby-1.9.3-p194. The root (sudo) password for the virtual box is `vagrant`. Also can connect to the box using `vagrant ssh`; this will be the `vagrant` user on the box.

The provision script uses shared folders so the repo on your host system is the same inside the guest box at `/vagrant` as well as `var/www`. Included in the provision are installations for nodejs, phantomjs, vim and ack-grep.

	git submodule init
	vagrant up
	vagrant ssh
	cd /vagrant
	sudo bundle install
	./bin/rakep build
	./bin/rakep server


#### Extras

* [bin/z-config.sh](bin/z-config.sh) configures [z][rupa_z], tool to jump to your most used directories
* [bin/vim-config.sh](bin/vim-config.sh) will setup up vim with IDE like tools see repo [pixelhandler/vim-config][pixelhandler_vim-config] 
* [bin/jsctags.sh](bin/jsctags.sh) configures [jsctags][jsctags], a ctags-compatible code indexing solution for JavaScript
* [bin/dotfiles.sh](bin/dotfiles.sh) will copy the `dotfiles` folder contents into your vagrant box. If you put your ssh keys, e.g. id_rsa for github, into the [dotfiles/.ssh](dotfiles/.ssh) directory the keys will be copied there as well.

Execute the scripts in the /vagrant/bin directory after provisioning the VirtualBox with vagrant and connecting using `vagrant ssh`

	vagrant ssh
	cd /vagrant/bin
	./dotfiles.sh
	sudo ./z-config.sh
	sudo ./jsctags.sh
	./vim-config.sh
	. ~/.bash_profile


## Links

* [Fire up Ember.js video][peepcode-emberjs-video] tutorial on building an Ordr application
* [Ember.js][emberjs] - A JavaScript framework for creating ambitious web applications
* [OC Ember JS][ocemberjs] meetup group in SoCal, this project was inspired by a talk in the February 2013 meeting
* Slides from OC Ember JS talk: [Ember.js Build Processes][ocemberjs-talk-dasfd]
* [Developers Against Single File Development][hjr3-dasfd] repository as example Ember.js application using build tools and includes  travis.yml example file for continous integration using [Travis][travis-ci]
* [VirtualBox][virtualbox] Downloads
* [Getting Started with Vagrant][vagrant]


[chef]: http://www.opscode.com/chef/ "Open-source automation platform"
[emberjs]: https://github.com/emberjs/ember.js "A JavaScript framework for creating ambitious web applications"
[hjr3-dasfd]: https://github.com/hjr3/dasfd "Developers Against Single File Development, by Herman Radtke"
[jsctags]: https://github.com/mozilla/doctorjs "a ctags-compatible code indexing solution for JavaScript"
[minispade-source]: https://github.com/wycats/rake-pipeline-web-filters/blob/master/lib/rake-pipeline-web-filters/minispade_filter.rb "Comments in minispade source"
[ocemberjs]: http://www.meetup.com/OC-EmberJS/ "Orange County Ember JS"
[ocemberjs-talk-dasfd]: https://docs.google.com/presentation/d/1qF29bi_tuBugt4rvXgMxTqQoThoycSlvF_OEOAfUS7c/edit#slide=id.p "Ember.js Build Processes, by Herman Radtke"
[peepcode]: https://peepcode.com "screencast tutorials for professional web developers and designers"
[peepcode-ordr-tweet]: https://twitter.com/peepcode/status/307660525339299840 "Ordr app used by permission"[rake-pipeline-web-filters"
[peepcode-emberjs-video]: https://peepcode.com/products/emberjs "Fire up Ember.js video, by Peepcode"
[pixelhandler_vim-config]: https://github.com/pixelhandler/vim-config "Bill Heaton's .vim configuration"
[rake-pipeline-web-filters]: https://github.com/wycats/rake-pipeline-web-filters "Rake::Pipeline::Web::Filters by Yehuda Katz"
[rupa_z]: https://github.com/rupa/z "z tracks your most used directories"
[stackoverflow-rake-pipeline]: http://stackoverflow.com/a/8565483/775246 "steps for getting a stock OSX environment set up with rake pipeline"
[travis-ci]: https://travis-ci.org
[vagrant]: http://docs.vagrantup.com/v1/docs/getting-started/ "Vagrant: Getting Started"
[vagrant-chef_solo]: http://docs.vagrantup.com/v1/docs/provisioners/chef_solo.html "Vagrant: Chef Solo Provisioning"
[virtualbox]: https://www.virtualbox.org/wiki/Downloads "Oracle’s VirtualBox"

[ember-handlebars-precompile]: https://gist.github.com/wagenet/1608575 "Ember Handlebars Precompile"
