#!/usr/bin/env bash

set -eu

error_handler() {
    echo "################################################################################"
    echo "# Setup failed"
    echo "################################################################################"
}

# Begin trapping errors
trap error_handler EXIT

# Set up OSX defaults
./osx.sh

# Run homebrew
./homebrew.sh

# Set up Sublime Text
./sublimetext.sh

# Copy files via stow
./stow.sh

# End trapping errors
trap - EXIT
