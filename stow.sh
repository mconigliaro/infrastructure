#!/usr/bin/env bash

set -eu

cd "$(dirname "${BASH_SOURCE[0]}")/stow"

stow_options='--verbose' # Add --delete to unstow
brew_prefix=$(brew --prefix)

# Miscellaneous scripts
stow $stow_options --target "$brew_prefix/bin" bin

# Git
stow $stow_options --target ~ git

# Gnupg
stow $stow_options --target ~ gnupg

# OpenSSH
if [[ ! -d ~/.ssh ]]; then
  mkdir ~/.ssh
  ssh-keygen -t rsa -b 4096 -o -a 100 -f ~/.ssh/id_rsa
fi
stow $stow_options --target ~ openssh

# Python
stow $stow_options --target ~ python

# Ruby
stow $stow_options --target ~ ruby

# Squid
if [[ -e "$brew_prefix/etc/squid.conf" && ! -L "$brew_prefix/etc/squid.conf" ]]; then
  rm "$brew_prefix/etc/squid.conf"
fi
stow $stow_options --target "$brew_prefix/etc" squid
if [[ ! -d "$brew_prefix/var/cache/squid/00" ]]; then
  squid -z
fi
brew services restart squid

# Sublime Text
killall -v 'Sublime Text' || true
stow $stow_options --target ~ sublime-text

# Test Kitchen
mkdir -p ~/.kitchen
stow $stow_options --target ~ test-kitchen

# Tor
stow $stow_options --target "$brew_prefix/etc/tor" tor

# ZSH
ZSH_PATH="$brew_prefix/bin/zsh"
if [[ "$SHELL" != "$ZSH_PATH" ]]; then
  sudo chsh -s "$ZSH_PATH" "$USER"
fi
stow $stow_options --target ~ zsh

hash -r
