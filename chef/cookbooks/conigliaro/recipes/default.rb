#
# Cookbook Name:: conigliaro
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
user "mike" do
  home "/home/mike"
  shell "/bin/bash"
  supports :manage_home => true
end

group "admin" do
  members ["mike"]
  append true
end
