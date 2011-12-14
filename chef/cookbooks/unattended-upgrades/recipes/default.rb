#
# Cookbook Name:: unattended-upgrades
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "unattended-upgrades" do
  package_name "unattended-upgrades"
end

template "10periodic" do
  source "10periodic.erb"
  path "/etc/apt/apt.conf.d/10periodic"
  mode "0644"
end

template "50unattended-upgrades" do
  source "50unattended-upgrades.erb"
  path "/etc/apt/apt.conf.d/50unattended-upgrades"
  mode "0644"
end
