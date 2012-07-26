#
# Cookbook Name:: smartmontools
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "smartmontools"

service "smartmontools" do
  action :enable
end

template "/etc/default/smartmontools" do
  source "smartmontools.default.erb"
  mode "0644"
  notifies :restart, "service[smartmontools]"
end

if node["smartmontools"]["start_smartd"] == "yes"
  template "/etc/monit/conf.d/smartmontools.monit" do
    source "smartmontools.monit.erb"
    mode "0644"
    notifies :restart, "service[monit]"
  end
else
  file "/etc/monit/conf.d/smartmontools.monit" do
    action :delete
    notifies :restart, "service[monit]"
  end
end
