#
# Cookbook Name:: mconigliaro
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
oh_my_zsh node[:mconigliaro][:user] do
  homedir node[:mconigliaro][:homedir]
  system_install node[:mconigliaro][:zsh_system_install]
  manage_zshrc true
end
