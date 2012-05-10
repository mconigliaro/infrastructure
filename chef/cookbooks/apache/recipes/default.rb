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

file "/etc/apache2/conf.d/default_redirect" do
  content "RedirectMatch ^/$ #{node[:apache][:default_redirect_path]}" unless node[:apache][:default_redirect_path].nil?
  mode "0644"
  notifies :restart, "service[apache2]"
end

template "/etc/monit/conf.d/apache.monit" do
  source "apache.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end

include_recipe "apache::authnz_external", "apache::authz_unixgroup", "apache::ssl"
