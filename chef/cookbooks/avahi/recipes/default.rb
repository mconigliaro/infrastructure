#
# Cookbook Name:: avahi
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
%w{
  avahi-daemon
  avahi-utils
}.each { |p| package p }

service "avahi-daemon"

template "/etc/monit/conf.d/avahi.monit" do
  source "avahi.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
