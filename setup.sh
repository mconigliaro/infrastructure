#!/usr/bin/env bash

set -eu

error_handler() {
    echo "################################################################################"
    echo "# Setup failed"
    echo "################################################################################"
}

# Begin trapping errors
trap error_handler EXIT

# Run homebrew
./homebrew.sh

# Set up asdf
./asdf.sh

# Install Package Control for Sublime Text 3
wget -nc -P "$HOME/Library/Application Support/Sublime Text 3/Installed Packages" "https://packagecontrol.io/Package Control.sublime-package"

# Install Ansible
pip3 install ansible ansible-lint flake8 --user

# Set up OSX defaults
./osx.sh

# Copy files via stow
./stow.sh

# End trapping errors
trap - EXIT
