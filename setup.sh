#!/bin/bash

set -ex

GEMS=${GEMS-"chef foodcritic veewee"}
BASEBOXES=${BASEBOXES-./definitions/*}

# Install RVM
if ! command -v rvm
then
  curl -L https://get.rvm.io | bash -s stable
  . ~/.rvm/scripts/rvm
  rvm rvmrc load
fi

# Install gems
for gem in ${GEMS}
do
  gem install ${gem}
done

# Build baseboxes
for box in ${BASEBOXES}
do
  box=${box##*/}
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
