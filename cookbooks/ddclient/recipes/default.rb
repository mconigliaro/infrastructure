#
# Cookbook Name:: ddclient
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "ddclient" do
  notifies :run, "execute[kill_ddclient]", :immediately
end

# FIXME: https://bugs.launchpad.net/ubuntu/+source/ddclient/+bug/980409
execute "kill_ddclient" do
  command "pkill ddclient || true"
  action :nothing
end

service "ddclient" do
  action :enable
end

template "/etc/ddclient.conf" do
  source "ddclient.conf.erb"
  mode "0600"
  notifies :run, "execute[kill_ddclient]", :immediately
  notifies :restart, "service[ddclient]"
end

template "/etc/default/ddclient" do
  source "ddclient.default.erb"
  mode "0644"
  notifies :run, "execute[kill_ddclient]", :immediately
  notifies :restart, "service[ddclient]"
end

if node["ddclient"]["run_daemon"] == "true"
  template "/etc/monit/conf.d/ddclient.monit" do
    source "ddclient.monit.erb"
    mode "0644"
    notifies :restart, "service[monit]"
  end
else
  file "/etc/monit/conf.d/ddclient.monit" do
    action :delete
    notifies :restart, "service[monit]"
  end
end
