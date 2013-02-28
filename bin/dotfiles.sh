#!/bin/bash

# use like
# `vagrant ssh`
# `/vagrant/bin/dotfiles.sh`

# Or for dry run... add option -d or --dry-run
# `/vagrant/bin/dotfiles.sh -d` 
# `/vagrant/bin/dotfiles.sh --dry-run` 

# To skip prompt and force execution... add option -f or --force
# `/vagrant/bin/dotfiles.sh -f` 
# `/vagrant/bin/dotfiles.sh --force` 

# Note copy your keys id_rsa and id_rsa.pub to /dotfiles/.ssh/ 
# this will copy the keys into your vagrant box
# e.g. `cp ~/.ssh/id_rsa* /your_path_to.../dotfiles/.ssh/`

cd "$(dirname "${BASH_SOURCE}")"

function doIt() {
    if [ ! -d $HOME/.ssh ]; then
        echo "Creating $HOME/.ssh directory"
        mkdir $HOME/.ssh
    fi
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "dotfiles.sh" --exclude "README.md" -Pav /vagrant/dotfiles/ ~
}
function dryRun() {
    echo "Dry Run..."
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "dotfiles.sh" --exclude "README.md" -Pavn /vagrant/dotfiles/ ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
elif [ "$1" == "--dry-run" -o "$1" == "-d" ]; then
    dryRun
else
    read -p "This may overwrite existing files in your /home/vagrant/ directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt
unset dryRun
source ~/.bash_profile


#DOTFILES='/vagrant/dotfiles' 

#if [ ! -d $HOME/.ssh ];
#then
    #echo "Creating $HOME/.ssh directory"
    #mkdir $HOME/.ssh

    #echo "Copying dotfiles/.ssh/config"
    #cp $DOTFILES/.ssh/config $HOME/.ssh/config

    #echo "Copying dotfiles/.bashrc into ~/.bashrc"
    #cat $DOTFILES/.bashrc >> $HOME/.bashrc
#fi

#should not need this precise64 box provisions with a .profile which includes .bashrc
#if [ ! -f $HOME/.bash_profile ];
#then
    #echo "Copying dotfiles/.bash_profile"
    #cp $DOTFILES/.bash_profile $HOME/.bash_profile
#fi

#if [ ! -f $HOME/.ackrc ];
#then
    #echo "Copying dotfiles/.ackrc"
    #cp $DOTFILES/.ackrc $HOME/.ackrc
#fi

#if [ ! -f $HOME/.gitconfig ];
#then
    #echo "Copying dotfiles/.gitconfig"
    #cp $DOTFILES/.gitconfig $HOME/.gitconfig
#fi

#if [ ! -f $HOME/.jshintrc ];
#then
    #echo "Copying dotfiles/.jshintrc"
    #cp $DOTFILES/.jshintrc $HOME/.jshintrc
#fi

#if [ ! -f $HOME/.jslintrc ];
#then
    #echo "Copying dotfiles/.jslintrc"
    #cp $DOTFILES/.jslintrc $HOME/.jslintrc
#fi

#if [ ! -f $HOME/.my.cnf ];
#then
    #echo "Copying dotfiles/.my.cnf"
    #cp $DOTFILES/.my.cnf $HOME/.my.cnf
#fi
