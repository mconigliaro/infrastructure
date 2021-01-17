# Infrastructure

## Getting Started
```
    mkdir -p ~/Developer/mconigliaro
    cd ~/Developer/mconigliaro
    git clone https://gitlab.com/mconigliaro/infrastructure.git
    cd infrastructure

    # Set up OSX
    ./osx.sh

    # Set up homebrew
    ./homebrew.sh

    # Set up Sublime Text
    ./sublimetext.sh

    # Copy files via stow
    ./stow.sh
```

## Borg Backups

Special permissions must be given in order for the `borg.mail.conigliaro.org` LaunchAgent to run:

1. System Preferences > Security & Privacy > Privacy
1. Add `bin/bash` to "Full Disk Access"

## Local Squid Proxy for Docker Desktop

1. Settings > Resources > Proxies > Web Server > http://docker.for.mac.localhost:3128

## GitHub Personal Access Tokens

1. Create a [personal access token](https://github.com/settings/tokens) with full `repo` permissions
1. Write the token to `~/.config/github/token` in order to avoid GitHub API throttling when using Homebrew

When using Git HTTPS Authentication with 2FA, log in using your username and a personal access token instead of your password.

## iTerm Shell Integration

1. iTerm2 > Install Shell Integration
1. Restart shell

## FIXME

- How to implement different profiles for home and work? (e.g. borg backups should only happen from home)
