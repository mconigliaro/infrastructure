#!/usr/bin/env bash

set -eu

# Install Homebrew
if ! command -v brew >/dev/null 2>&1; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install packages
brew bundle
hash -r

# Allow launchctl to find Homebrew binaries
sudo launchctl config user path /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
