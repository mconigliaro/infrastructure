# Infrastructure

## Getting Started

    mkdir -p ~/Developer/mconigliaro
    cd ~/Developer/mconigliaro
    git clone https://gitlab.com/mconigliaro/infrastructure.git
    cd infrastructure
    ./setup.sh

## GitHub Personal Access Tokens

1. Create a [personal access token](https://github.com/settings/tokens) with full `repo` permissions
1. Write the token to `~/.github_api_token` in order to avoid GitHub API throttling when using Homebrew

When using Git HTTPS Authentication with 2FA, log in using your username and a personal access token instead of your password.

## iTerm

1. iTerm2 -> Install Shell Integration
1. Restart shell
