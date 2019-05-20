# asdf
asdf_root=$(brew --prefix)/opt/asdf
if [[ -d "$asdf_root" ]]; then
  source "$asdf_root/asdf.sh"
  source "$asdf_root/etc/bash_completion.d/asdf.bash"
fi

# iTerm2 Shell Integration
iterm_shell_integration_path="$HOME/.iterm2_shell_integration.zsh"
if [[ -e "$iterm_shell_integration_path" ]]; then
  source "$iterm_shell_integration_path"
fi

# Pull in everything else we decided not to keep in source control
zshrc_d=$HOME/.zshrc.d
if [[ -d "$zshrc_d" && ! -z "$(ls -A "$zshrc_d")" ]]; then
  for f in "$zshrc_d"/*; do
    source "$f";
  done
fi
