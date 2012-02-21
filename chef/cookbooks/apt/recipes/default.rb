#
# Cookbook Name:: apt
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
template "/etc/apt/apt.conf.d/01ubuntu" do
  source "01ubuntu.erb"
  mode "0644"
end

template "/etc/apt/apt.conf.d/70debconf" do
  source "70debconf.erb"
  mode "0644"
end

execute "aptitude_update" do
  command "/usr/bin/aptitude update"
  ignore_failure true
end

template "sources.list" do
  source "sources.list.erb"
  path "/etc/apt/sources.list"
  mode "0644"
  notifies :run, "execute[aptitude_update]", :immediately
end
