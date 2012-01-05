#
# Cookbook Name:: ddclient
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "ddclient"

service "ddclient" do
  action :enable
end

template "/etc/ddclient.conf" do
  source "ddclient.conf.erb"
  mode "0600"
  notifies :restart, resources(:service => "ddclient")
end

template "/etc/default/ddclient.conf" do
  source "ddclient.conf.default.erb"
  mode "0644"
  notifies :restart, resources(:service => "ddclient")
end

template "/etc/monit/conf.d/ddclient.monit" do
  source "ddclient.monit.erb"
  mode "0644"
  notifies :restart, resources(:service => "monit")
end
