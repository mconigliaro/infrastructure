#
# Cookbook Name:: openssh
# Recipe:: server
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "openssh-server"

service "ssh" do
  action :enable
end

template "/etc/ssh/sshd_config" do
  source "sshd_config.erb"
  mode "0644"
  notifies :restart, "service[ssh]"
end

template "/etc/monit/conf.d/openssh.monit" do
  source "openssh.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
