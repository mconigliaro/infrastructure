#
# Cookbook Name:: monit
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "monit"

service "monit" do
  action :enable
end

template "/etc/default/monit" do
  source "monit.default.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end

template "/etc/monit/monitrc" do
  source "monitrc.erb"
  mode "0600"
  notifies :restart, "service[monit]"
end

template "/etc/monit/conf.d/system.monit" do
  source "system.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end

template "/etc/cron.daily/monit-monitor-all" do
  source "monit-monitor-all.erb"
  mode "0755"
end
