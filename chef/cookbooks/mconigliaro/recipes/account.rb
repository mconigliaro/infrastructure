#
# Cookbook Name:: mconigliaro
# Recipe:: account
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
user node[:mconigliaro][:user] do
  comment "Mike Conigliaro"
  home node[:mconigliaro][:homedir]
  shell "/bin/zsh"
  supports :manage_home => true
end

group node[:lsb][:release] == "11.10" ? "admin" : "sudo" do
  members [node[:mconigliaro][:user]]
  append true
end
