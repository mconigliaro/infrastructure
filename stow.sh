#!/usr/bin/env bash

set -eu

cd "$(dirname "${BASH_SOURCE[0]}")/stow"

stow_options="--verbose $*" # Use --delete to unstow
brew_prefix=$(brew --prefix)

# Miscellaneous scripts
stow $stow_options --target "$brew_prefix/bin" --no-folding bin

# Git
stow $stow_options --target "$HOME" --no-folding git

# Gnupg
stow $stow_options --target "$HOME" --no-folding gnupg

# launchd
stow $stow_options --target "$HOME" --no-folding launchd
launchctl load ~/Library/LaunchAgents/*

# OpenSSH
if [[ ! -d "$HOME/.ssh" ]]; then
    ssh-keygen -t rsa -b 4096 -o -a 100
fi
stow $stow_options --target "$HOME" --no-folding openssh

# Python
stow $stow_options --target "$HOME" --no-folding python

# Ruby
stow $stow_options --target "$HOME" ruby

# Squid
squid_conf="$brew_prefix/etc/squid.conf"
if [[ -e "$squid_conf" && ! -L "$squid_conf" ]]; then
    mv "$squid_conf" "$squid_conf-orig"
fi
stow $stow_options --target "$brew_prefix" --no-folding squid
if [[ ! -d "$brew_prefix/var/cache/squid/00" ]]; then
    squid -z
fi
brew services restart squid

# Sublime Text
sublime_package_dir="$HOME/Library/Application Support/Sublime Text 3/Packages"
if [[ -e "$sublime_package_dir/User" && ! -L "$sublime_package_dir/User" ]]; then
    killall -v 'Sublime Text' || true
    mv "$sublime_package_dir/User" "$sublime_package_dir/User-orig"
fi
stow $stow_options --target "$sublime_package_dir" sublime-text

# Test Kitchen
stow $stow_options --target "$HOME" --no-folding test-kitchen

# Tor
stow $stow_options --target "$brew_prefix" --no-folding tor

# ZSH
zsh_path="$brew_prefix/bin/zsh"
if [[ "$SHELL" != "$zsh_path" ]]; then
    sudo chsh -s "$zsh_path" "$USER"
fi
stow $stow_options --target "$HOME" zsh
