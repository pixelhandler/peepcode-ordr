#!/bin/bash

# use like
# `vagrant ssh`
# `/vagrant/bin/rsync_api.sh`

# Or for dry run... add option -d or --dry-run
# `/vagrant/bin/rsync_api.sh --dry-run` 

cd "$(dirname "${BASH_SOURCE}")"

function doIt() {
    if [ ! -d $HOME/.ssh ]; then
        echo "Syncing $HOME/api directory to /vagrant/api"
        mkdir $HOME/.ssh
    fi
    rsync -Pav --exclude=".dpd" --exclude="data" ~/api/ /vagrant/api/
}
function dryRun() {
    echo "Dry Run..."
    rsync -Pavn --exclude=".dpd" --exclude="data" ~/api/ /vagrant/api/
}
if [ "$1" == "--dry-run" ]; then
    dryRun
elif [ "$1" == "--dump" ]; then
    mongodump --db -deployd --dbpath ~/api/data --journal -o ~/api/dump
elif [ "$1" == "--export" -a "$2" != '' ]; then
    mongoexport --db -deployd --dbpath ~/api/data --journal -c $2 -o ~/api/export/$2.json
else
    read -p "This may overwrite existing files in your /vagrant/api/ directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt
unset dryRun