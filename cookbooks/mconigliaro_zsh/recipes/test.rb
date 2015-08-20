#
# Cookbook Name:: mconigliaro_zsh
# Recipe:: test
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_zsh'

user 'vagrant' do
  shell '/bin/zsh'
end

mconigliaro_zsh_oh_my_zsh 'vagrant' do
  theme 'gentoo'
end
