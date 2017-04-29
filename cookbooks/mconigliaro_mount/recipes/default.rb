#
# Cookbook Name:: mconigliaro_mount
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

node['mconigliaro_mount']['mount'].each do |dev, mount_point|
  directory mount_point do
    recursive true
    mode '0755'
  end

  execute "format #{dev}" do
    command "mkfs.#{node['mconigliaro_mount']['format']} #{dev}"
    not_if { node['mconigliaro_mount']['format'].nil? }
    not_if "file -sL #{dev} | grep 'filesystem'"
  end

  mount mount_point do
    device dev
    action [:mount, :enable]
  end

  mount_point_name = mount_point.tr('/', '_')[1..-1]
  mconigliaro_monit_service mount_point_name do
    source 'mount.monit.erb'
    variables(
      mount_point_name: mount_point_name,
      mount_point: mount_point
    )
  end
end
