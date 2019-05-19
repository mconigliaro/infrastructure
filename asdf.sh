#!/usr/bin/env bash

set -eu

# Install asdf plugins
for p in ruby python; do
  asdf plugin-add $p || true
done
