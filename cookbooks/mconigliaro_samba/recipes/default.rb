#
# Cookbook Name:: mconigliaro_samba
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'samba'

%w(smbd nmbd).each do |obj|
  service obj do
    action [:start, :enable]
  end
end

directory '/var/lib/samba/netlogon' do
  mode '0755'
end

%w(logon.cmd Win7_Samba3DomainMember.reg).each do |obj|
  cookbook_file "/var/lib/samba/netlogon/#{obj}" do
    mode '0644'
    %w(smbd nmbd).each { |service| notifies :restart, "service[#{service}]" }
  end
end

template '/etc/samba/smb.conf' do
  variables(
    workgroup: node['mconigliaro_samba']['workgroup']
  )
  mode '0644'
  %w(smbd nmbd).each { |obj| notifies :restart, "service[#{obj}]" }
end

%w(machines domainadmins).each do |obj|
  group obj
end

execute "net groupmap add ntgroup='Domain Admins' unixgroup='domainadmins' rid=512 type=d" do
  not_if "net groupmap list ntgroup='Domain Admins' | grep domainadmins"
end

mconigliaro_monit_service 'samba'
