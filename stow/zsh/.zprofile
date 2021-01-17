export EDITOR=vim

# Load Antigen and plugins
source "$(brew --prefix)/share/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen theme gentoo
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)

# AWS
export AWS_SDK_LOAD_CONFIG=true # aws-sdk-js

# GitHub CLI
export GH_TOKEN="$(<$HOME/.config/github/token)"

# Homebrew
if command -v brew > /dev/null 2>&1; then
  export PATH=/usr/local/sbin:$PATH
  export HOMEBREW_GITHUB_API_TOKEN="$GH_TOKEN"
  export HOMEBREW_NO_AUTO_UPDATE=1
fi

# Postgres.app
postgres_app_path=/Applications/Postgres.app/Contents/Versions/9.5/bin
if [[ -e "$postgres_app_path" ]]; then
  export PATH="$postgres_app_path:$PATH"
fi

# Python
eval "$(pyenv init -)"
export PYENV_VERSION=3.6.10
export PYTHONSTARTUP="$HOME/.config/python/startup"
export PIPENV_SHELL_FANCY=1

# Ruby
eval "$(rbenv init -)"

# ShellCheck
export SHELLCHECK_OPTS="-e SC1090"

# Pull in everything else we decided not to keep in source control
zprofile_d=$HOME/.zprofile.d
if [[ -d "$zprofile_d" && -n "$(ls -A "$zprofile_d")" ]]; then
  for f in "$zprofile_d"/*; do
    source "$f";
  done
fi
