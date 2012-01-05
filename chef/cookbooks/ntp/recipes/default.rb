#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "ntp"

service "ntp" do
  action :enable
end

template "/etc/monit/conf.d/ntp.monit" do
  source "ntp.monit.erb"
  mode "0644"
  notifies :restart, resources(:service => "monit")
end
