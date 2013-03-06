#!/bin/bash

# To setup the deployd api in /home/vagrant/api
# `vagrant ssh`
# `sudo /vagrant/bin/dpd_api.sh --setup`

# To sync files from your ~/api use:
# `vagrant ssh`
# `/vagrant/bin/dpd_api.sh`
# Or for dry run... add option -d or --dry-run
# `/vagrant/bin/dpd_api.sh --dry-run`

cd "$(dirname "${BASH_SOURCE}")"

function syncToRepo() {
    echo "Syncing $HOME/api directory to /vagrant/api"
    rsync -Pav --exclude=".dpd" --exclude="data" ~/api/ /vagrant/api/
}
function dryRun() {
    echo "Dry Run..."
    rsync -Pavn --exclude=".dpd" --exclude="data" ~/api/ /vagrant/api/
}
function setUp() {
    if [ ! -d $HOME/api ]; then
        cd $HOME && dpd create api
    fi
    echo "Syncing /vagrant/api directory to $HOME/api"
    rsync -Pav --exclude=".dpd" --exclude="data" /vagrant/api/ $HOME/api/
    chown -R vagrant:vagrant $HOME/api
    restoreDb
}
function dumpDb() {
    mongodump --db -deployd --dbpath ~/api/data --journal -o ~/api/dump
}
function restoreDb() {
    mongorestore --db -deployd --dbpath ~/api/data --journal --drop /vagrant/api/dump/-deployd
}
if [ "$1" == "--setup" ]; then
    read -p "This may overwrite existing files in your $HOME/api/ directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setUp
    fi
elif [ "$1" == "--dump" ]; then
    dumpDb
elif [ "$1" == "--restore" ]; then
    restoreDb
elif [ "$1" == "--export" -a "$2" != "" ]; then
    mongoexport --db -deployd --dbpath ~/api/data --journal -c $2 -o ~/api/export/$2.json
elif [ "$1" == "--dry-run" -o "$1" == "-d" ]; then
    dryRun
else
    read -p "This may overwrite existing files in your /vagrant/api/ directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        syncToRepo
    fi
fi
unset syncToRepo
unset dryRun
unset setUp
unset dumpDb
unset restoreDb
