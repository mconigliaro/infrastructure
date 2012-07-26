#
# Cookbook Name:: unattended-upgrades
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "unattended-upgrades"

template "/etc/apt/apt.conf.d/02periodic" do
  source "02periodic.erb"
  mode "0644"
end

template "/etc/apt/apt.conf.d/50unattended-upgrades" do
  source "50unattended-upgrades.erb"
  mode "0644"
end
