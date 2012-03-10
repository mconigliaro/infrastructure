#
# Cookbook Name:: avahi-daemon
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "avahi-daemon"

service "avahi-daemon" do
  action :enable
end

template "/etc/monit/conf.d/avahi-daemon.monit" do
  source "avahi-daemon.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
