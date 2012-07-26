#
# Cookbook Name:: apcupsd
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "apcupsd"

service "apcupsd" do
  action :enable
end

template "/etc/default/apcupsd" do
  source "apcupsd.default.erb"
  mode "0644"
  notifies :restart, "service[apcupsd]"
end

template "/etc/apcupsd/apcupsd.conf" do
  source "apcupsd.conf.erb"
  mode "0600"
  notifies :restart, "service[apcupsd]"
end

if node["apcupsd"]["isconfigured"] == "yes"
  template "/etc/monit/conf.d/apcupsd.monit" do
    source "apcupsd.monit.erb"
    mode "0644"
    notifies :restart, "service[monit]"
  end
else
  file "/etc/monit/conf.d/apcupsd.monit" do
    action :delete
    notifies :restart, "service[monit]"
  end
end
