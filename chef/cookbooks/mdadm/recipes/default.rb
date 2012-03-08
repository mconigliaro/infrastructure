#
# Cookbook Name:: mdadm
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "mdadm"

template "/etc/monit/conf.d/mdadm.monit" do
  source "mdadm.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
