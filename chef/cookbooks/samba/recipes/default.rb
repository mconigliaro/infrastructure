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

directory "/srv/samba/netlogon" do
  recursive true
end

%w{
  logon.cmd
  Win7_Samba3DomainMember.reg
}.each do |f|
  cookbook_file "/srv/samba/netlogon/#{f}" do
    source f
    mode "0644"
    services.each { |s| notifies :restart, "service[#{s}]" }
  end
end

%w{
  machines
  domainadmins
}.each { |g| group g }

template "/etc/samba/smb.conf" do
  source "smb.conf.erb"
  mode "0644"
  services.each { |s| notifies :restart, "service[#{s}]" }
end

execute "net groupmap add ntgroup='Domain Admins' unixgroup='domainadmins' rid=512 type=d" do
  not_if "net groupmap list ntgroup='Domain Admins' | grep domainadmins"
end

# FIXME: Why does this prompt for a password in production?
# samba_user "root" do
#   password node["samba"]["root_password"]
# end
#
# execute "echo '#{node["samba"]["root_password"]}' | net rpc rights grant -U root '#{node["samba"]["workgroup"]}\\Domain Admins' SeMachineAccountPrivilege SePrintOperatorPrivilege SeAddUsersPrivilege SeDiskOperatorPrivilege SeRemoteShutdownPrivilege"

template "/etc/monit/conf.d/samba.monit" do
  source "samba.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
