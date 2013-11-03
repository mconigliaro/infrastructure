#
# Cookbook Name:: minidlna
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#

include_recipe "monit"

package "minidlna"

service "minidlna" do
  action :enable
end

template "/etc/minidlna.conf" do
  source "minidlna.conf.erb"
  mode "0644"
  owner "minidlna"
  group "minidlna"
  notifies :restart, "service[minidlna]"
end

template "/etc/default/minidlna" do
  source "minidlna.default.erb"
  mode "0644"
  notifies :restart, "service[minidlna]"
end

template "/etc/monit/conf.d/minidlna.monit" do
  source "minidlna.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end