#!/usr/bin/env bash

set -eu

# Install Homebrew
if ! command -v brew >/dev/null 2>&1; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install packages
brew bundle
