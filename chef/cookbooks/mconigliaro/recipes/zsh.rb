#
# Cookbook Name:: mconigliaro
# Recipe:: zsh
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
oh_my_zsh node[:mconigliaro][:user] do
  homedir node[:mconigliaro][:homedir]
  manage_zshrc true
end
