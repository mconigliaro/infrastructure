#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "apache2"

service "apache2" do
  action :enable
end

template "/etc/apache2/conf.d/default_redirect" do
  source "default_redirect.erb"
  mode "0644"
  notifies :restart, resources(:service => "apache2")
end

template "/etc/monit/conf.d/apache.monit" do
  source "apache.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end

include_recipe "apache::authnz_external", "apache::authz_unixgroup", "apache::ssl"
