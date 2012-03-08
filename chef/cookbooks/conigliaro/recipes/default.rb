#
# Cookbook Name:: conigliaro
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
user "mike" do
  comment "Mike Conigliaro"
  home "/home/mike"
  shell "/bin/zsh"
  supports :manage_home => true
end

group node[:lsb][:release] == "11.10" ? "admin" : "sudo" do
  members ["mike"]
  append true
end

include_recipe "zsh"

oh_my_zsh "mike" do
  manage_zshrc true
end
