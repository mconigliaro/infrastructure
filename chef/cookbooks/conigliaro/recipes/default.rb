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

git "/home/mike/.oh-my-zsh" do
  repository "git://github.com/robbyrussell/oh-my-zsh.git"
end

template "/home/mike/.zshrc" do
  source ".zshrc.erb"
  mode "0644"
  owner "mike"
  group "mike"
end
