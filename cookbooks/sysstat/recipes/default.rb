#
# Cookbook Name:: sysstat
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "sysstat"

service "sysstat" do
  action :enable
end

template "/etc/default/sysstat" do
  source "sysstat.default.erb"
  mode "0644"
  notifies :restart, "service[sysstat]"
end
