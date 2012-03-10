#
# Cookbook Name:: netatalk
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "netatalk"

service "netatalk" do
  action :enable
end

template "/etc/monit/conf.d/netatalk.monit" do
  source "netatalk.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end