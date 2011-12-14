#
# Cookbook Name:: monit
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "monit" do
  package_name "monit"
end

service "monit" do
  service_name "monit"
  action :enable
end

template "monit.default" do
  source "monit.default.erb"
  path "/etc/default/monit"
  mode "0644"
  notifies :restart, resources(:service => "monit")
end

template "monitrc" do
  source "monitrc.erb"
  path "/etc/monit/monitrc"
  mode "0600"
  notifies :restart, resources(:service => "monit")
end

template "system.monit" do
  source "system.monit.erb"
  path "/etc/monit/conf.d/system.monit"
  mode "0644"
  notifies :restart, resources(:service => "monit")
end
