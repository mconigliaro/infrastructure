#
# Cookbook Name:: mconigliaro_mdadm
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
package 'mdadm'

mdadm node['mconigliaro_mdadm']['raid_device'] do
  devices Dir.glob(node['mconigliaro_mdadm']['volumes']).sort
  level node['mconigliaro_mdadm']['raid_level']
  not_if { ::File.exist?(node['mconigliaro_mdadm']['raid_device']) }
end

execute 'format_raid_device' do
  command "mkfs.ext4 #{node['mconigliaro_mdadm']['raid_device']}"
  not_if "file -sL #{node['mconigliaro_mdadm']['raid_device']} | grep 'ext4 filesystem'"
end

template '/etc/mdadm/mdadm.conf' do
  mode 00644
  notifies :restart, 'service[mdadm]'
end

service 'mdadm' do
  action [:start, :enable]
end

directory node['mconigliaro_mdadm']['mount_point'] do
  recursive true
  mode 00755
end

mount node['mconigliaro_mdadm']['mount_point'] do
  device node['mconigliaro_mdadm']['raid_device']
  action [:mount, :enable]
end
