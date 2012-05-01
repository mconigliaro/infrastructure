#
# Cookbook Name:: bind
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "bind9"

service "bind9" do
  action :enable
end

template "/etc/monit/conf.d/bind.monit" do
  source "bind.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
