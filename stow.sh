#!/usr/bin/env bash

set -eu

cd "$(dirname "${BASH_SOURCE[0]}")/stow"

stow_options="--verbose $*" # Use --delete to unstow
brew_prefix=$(brew --prefix)

# Miscellaneous scripts
stow $stow_options --target "$brew_prefix/bin" bin

# Git
stow $stow_options --target "$HOME" git

# Gnupg
if [[ ! -d "$HOME/.gnupg" ]]; then
    mkdir "$HOME/.gnupg"
fi
stow $stow_options --target "$HOME/.gnupg" gnupg

# launchd
stow $stow_options --target "$HOME/Library/LaunchAgents" launchd

# OpenSSH
if [[ ! -d "$HOME/.ssh" ]]; then
    mkdir "$HOME/.ssh"
    ssh-keygen -t rsa -b 4096 -o -a 100 -f "$HOME/.ssh/id_rsa"
fi
stow $stow_options --target "$HOME/.ssh" openssh

# Python
stow $stow_options --target "$HOME" python

# Ruby
stow $stow_options --target "$HOME" ruby

# Squid
squid_conf="$brew_prefix/etc/squid.conf"
if [[ -e "$squid_conf" && ! -L "$squid_conf" ]]; then
    mv "$squid_conf" "$squid_conf-orig"
fi
stow $stow_options --target "$brew_prefix/etc" squid
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
mkdir -p "$HOME/.kitchen"
stow $stow_options --target "$HOME/.kitchen" test-kitchen

# Tor
stow $stow_options --target "$brew_prefix/etc/tor" tor

# ZSH
zsh_path="$brew_prefix/bin/zsh"
if [[ "$SHELL" != "$zsh_path" ]]; then
    sudo chsh -s "$zsh_path" "$USER"
fi
stow $stow_options --target "$HOME" zsh

hash -r
