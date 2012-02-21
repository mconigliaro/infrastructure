#!/bin/bash

GEMS=(
  chef
  vagrant
  veewee
)

for GEM in "${GEMS[@]}"
do
  gem install $GEM
done