#
# Cookbook Name:: mconigliaro_users
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_zsh'

user 'mike' do
  comment 'Mike Conigliaro'
  home '/home/mike'
  shell '/bin/zsh'
  supports manage_home: true
end

group 'sudo' do
  members %w(mike)
  append true
end

mconigliaro_zsh_oh_my_zsh 'mike' do
  theme 'gentoo'
end
