#!/bin/bash

set -ex

GEMS="chef foodcritic veewee"

# Install RVM
if ! command -v rvm
then
  curl -L https://get.rvm.io | bash -s stable
  . ~/.rvm/scripts/rvm
  rvm rvmrc load
fi

# Install gems
gem install ${GEMS}

# Build baseboxes
for box in ./definitions/*
do
  vagrant basebox build ${box}
  if [[ -f ${box}.box ]]
  then
    rm ${box}.box
  fi
  vagrant basebox export ${box}
  if [[ -d ~/.vagrant.d/boxes/${box} ]]
  then
    vagrant box remove ${box}
  fi
  vagrant box add ${box} ${box}.box
done
