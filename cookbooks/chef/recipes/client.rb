#
# Cookbook Name:: chef
# Recipe:: client
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
include_recipe "chef"

service "chef-client" do
  action node["chef"]["client"]["daemon_enabled"] ? [:enable, :start] : :disable
end

template "/etc/chef/client.rb" do
  source "client.rb.erb"
  mode "0644"
end

template "/etc/default/chef-client" do
  source "chef-client.default.erb"
  mode "0644"
  notifies :restart, "service[chef-client]"
  only_if { node["chef"]["client"]["daemon_enabled"] }
end

template "/etc/monit/conf.d/chef-client.monit" do
  source "chef-client.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
  only_if { node["chef"]["client"]["daemon_enabled"] }
end
