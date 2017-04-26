#
# Cookbook Name:: mconigliaro_zsh
# Recipe:: test
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_zsh'

user 'vagrant' do
  shell '/bin/zsh'
end

mconigliaro_zsh_antigen 'vagrant' do
  theme 'gentoo'
  bundles %w(
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    zsh-users/zsh-syntax-highlighting
  )
  exports(
    'ZSH_AUTOSUGGEST_STRATEGY' => 'match_prev_cmd'
  )
end
