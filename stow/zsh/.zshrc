# Pull in everything else we decided not to keep in source control
zshrc_d=$HOME/.zshrc.d
if [[ -d "$zshrc_d" && ! -z "$(ls -A "$zshrc_d")" ]]; then
  for f in "$zshrc_d"/*; do
    source "$f";
  done
fi
