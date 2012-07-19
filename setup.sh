#!/bin/bash

set -ex

gem install chef foodcritic veewee

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
