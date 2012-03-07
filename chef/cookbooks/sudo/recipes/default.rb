#
# Cookbook Name:: sudo
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
template "/etc/sudoers" do
  source "sudoers.erb"
  mode "0440"
end

template "/etc/sudoers.d/ec2" do
  source "ec2.erb"
  mode "0440"
  only_if { node[:cloud] && node[:cloud][:provider] == "ec2" }
end
