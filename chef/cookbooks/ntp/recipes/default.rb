#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "ntp" do
  package_name "ntp"
end

service "ntp" do
  service_name "ntp"
  action :enable
end

template "ntp.monit" do
  source "ntp.monit.erb"
  path "/etc/monit/conf.d/ntp.monit"
  mode "0644"
  notifies :restart, resources(:service => "monit")
end
