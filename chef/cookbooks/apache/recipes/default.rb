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

template "/etc/monit/conf.d/apache.monit" do
  source "apache.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end

include_recipe "apache::authnz_external"
include_recipe "apache::authz_unixgroup"
include_recipe "apache::ssl"
