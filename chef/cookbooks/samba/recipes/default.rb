#
# Cookbook Name:: samba
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "samba"

services = %w{
  smbd
  nmbd
}

services.each { |s| service s }

template "/etc/samba/smb.conf" do
  source "smb.conf.erb"
  mode "0644"
  services.each { |s| notifies :restart, "service[#{s}]" }
end

template "/etc/monit/conf.d/samba.monit" do
  source "samba.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
