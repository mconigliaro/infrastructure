#!/usr/bin/env bash

set -eu

# Install Package Control
wget -nc -P "$HOME/Library/Application Support/Sublime Text 3/Installed Packages" "https://packagecontrol.io/Package Control.sublime-package"

npm install csslint htmlhint -g
pip install ansible-lint flake8 yamllint
