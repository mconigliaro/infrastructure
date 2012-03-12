#
# Cookbook Name:: cups
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "cups"

service "cups"

template "/etc/cups/cupsd.conf" do
  source "cupsd.conf.erb"
  mode "0644"
  notifies :restart, "service[cups]"
end

template "/etc/monit/conf.d/cups.monit" do
  source "cups.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end

