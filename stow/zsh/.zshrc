iterm2_shell_integration=$HOME/.iterm2_shell_integration.zsh
if [[ -e "$iterm2_shell_integration" ]]; then
    source "$iterm2_shell_integration"
fi

# Pull in everything else we decided not to keep in source control
zshrc_d=$HOME/.zshrc.d
if [[ -d "$zshrc_d" && -n "$(ls -A "$zshrc_d")" ]]; then
  for f in "$zshrc_d"/*; do
    source "$f";
  done
fi
