#
# Cookbook Name:: unattended-upgrades
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "unattended-upgrades"

template "/etc/apt/apt.conf.d/10periodic" do
  source "10periodic.erb"
  mode "0644"
end

template "/etc/apt/apt.conf.d/50unattended-upgrades" do
  source "50unattended-upgrades.erb"
  mode "0644"
end
