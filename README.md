# Peepcode Ember.js Ordr app

See: <https://peepcode.com/products/emberjs>

## Build Tools

* Uses [rake-pipeline-web-filters](https://github.com/wycats/rake-pipeline-web-filters)
* See the [Assetfile](Assetfile) for details of the build and links to docs
* Uses Minispade for dependency management see [comments in minispade source](https://github.com/wycats/rake-pipeline-web-filters/blob/master/lib/rake-pipeline-web-filters/minispade_filter.rb)

## Directories

* `app` - your application files
* `tmp` - used by build tools
* `public` - used as destination of build tools
* `dotfiles` - can be used to setup your vagrant box
* `bin` - has some shell scripts and is used by the build tools for executables e.g. `/bin/rakep build` or `/bin/rakep server`

## Vagrant Box

* Box used: `precise64-ruby-1.9.3-p194`
* Uses an IP of 192.168.10.220, change if you like, this can be used to view the Ordr app with <http://192.168.10.220:9292>