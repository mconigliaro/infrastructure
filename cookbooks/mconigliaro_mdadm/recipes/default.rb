#
# Cookbook Name:: mconigliaro_mdadm
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'mdadm'

service 'mdadm' do
  action [:start, :enable]
end

mdadm node['mconigliaro_mdadm']['raid_device'] do
  devices Dir.glob(node['mconigliaro_mdadm']['volumes']).sort
  level node['mconigliaro_mdadm']['raid_level']
  not_if { ::File.exist?(node['mconigliaro_mdadm']['raid_device']) }
end

# Important: This file must be written after all md devices are created in order
# to have all the array definitions
template '/etc/mdadm/mdadm.conf' do
  mode '0644'
  notifies :restart, 'service[mdadm]'
  notifies :run, 'execute[update-initramfs]'
end

# Update initramfs so it'll have the updated mdadm.conf on boot
# See: http://serverfault.com/questions/763870/raid-device-on-rename-appended-with-0
execute 'update-initramfs' do
  command 'update-initramfs -u'
  action :nothing
end

mconigliaro_monit_service 'mdadm'
