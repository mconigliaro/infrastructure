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
  rm ${box}.box || true
  vagrant basebox export ${box}
  vagrant box remove ${box} || true
  vagrant box add ${box} ${box}.box
done
