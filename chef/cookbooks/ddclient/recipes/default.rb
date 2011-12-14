#
# Cookbook Name:: ddclient
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "ddclient" do
  package_name "ddclient"
end

service "ddclient" do
  service_name "ddclient"
  action :enable
end

template "ddclient.conf" do
  source "ddclient.conf.erb"
  path "/etc/ddclient.conf"
  mode "0600"
  notifies :restart, resources(:service => "ddclient")
end

template "ddclient.conf.default" do
  source "ddclient.conf.default.erb"
  path "/etc/default/ddclient.conf"
  mode "0644"
  notifies :restart, resources(:service => "ddclient")
end

template "ddclient.monit" do
  source "ddclient.monit.erb"
  path "/etc/monit/conf.d/ddclient.monit"
  mode "0644"
  notifies :restart, resources(:service => "monit")
end
