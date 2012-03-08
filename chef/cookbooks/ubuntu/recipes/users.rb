#
# Cookbook Name:: ubuntu
# Recipe:: users
#
# Copyright 2012, Michael Paul Thomas Conigliaro
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

oh_my_zsh "mike" do
  manage_zshrc true
end
