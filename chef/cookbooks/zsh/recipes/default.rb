#
# Cookbook Name:: zsh
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "zsh"

git "/opt/oh-my-zsh" do
  repository "git://github.com/robbyrussell/oh-my-zsh.git"
end
