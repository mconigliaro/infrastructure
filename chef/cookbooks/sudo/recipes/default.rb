#
# Cookbook Name:: sudo
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
template "/etc/sudoers.d/local" do
  source "local.erb"
  mode "0440"
end
