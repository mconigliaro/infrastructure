export EDITOR=vim

# Load Antigen and plugins
source "$(brew --prefix)/share/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen theme gentoo
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

export ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd

# AWS
export AWS_SDK_LOAD_CONFIG=true # aws-sdk-js

# Homebrew
if command -v brew > /dev/null 2>&1; then
  export PATH=/usr/local/sbin:$PATH
  export GITHUB_API_TOKEN="$(<$HOME/.github_api_token)"
fi

# Postgres.app
postgres_app_path=/Applications/Postgres.app/Contents/Versions/9.5/bin
if [[ -e "$postgres_app_path" ]]; then
  export PATH="$postgres_app_path:$PATH"
fi

# Python
export PYTHONSTARTUP=~/.pystartup
export PATH="$HOME/.local/bin:$PATH"
export PIPENV_SHELL_FANCY="1"

# Ruby
for v in 2.3.0 2.4.0 2.5.0; do
  export PATH="$HOME/.gem/ruby/$v/bin:$PATH"
done

# ShellCheck
export SHELLCHECK_OPTS="-e SC1090"

# Terraform (aws_codepipeline provider)
export GITHUB_TOKEN="$GITHUB_API_TOKEN"

# Pull in everything else we decided not to keep in source control
zprofile_d=$HOME/.zprofile.d
if [[ -d "$zprofile_d" && ! -z "$(ls -A "$zprofile_d")" ]]; then
  for f in "$zprofile_d"/*; do
    source "$f";
  done
fi
