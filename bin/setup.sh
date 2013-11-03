#!/bin/bash

set -eu

GEMS=${GEMS-"bundler chef foodcritic veewee"}
BASEBOXES=${BASEBOXES-./definitions/*}

# Install RVM
if ! command -v rvm
then
  curl -L https://get.rvm.io | bash -s stable
  . ~/.rvm/scripts/rvm
  rvm rvmrc load
fi

# Install gems
bundle install
GEM_LIST=$(gem list)
for gem in ${GEMS}
do
  echo "$GEM_LIST" | grep -q "^${gem} " || gem install ${gem}
done

# Build baseboxes
for box in ${BASEBOXES}
do
  box=${box##*/}
  bundle exec vagrant basebox build ${box} --force
  bundle exec vagrant basebox export ${box} --force
  bundle exec vagrant box add ${box} ${box}.box --force
done
