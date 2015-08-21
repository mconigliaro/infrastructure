#
# Cookbook Name:: mconigliaro_nfs_server
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
package 'nfs-kernel-server'

service 'nfs-kernel-server' do
  action [:start, :enable]
end

%w(nfs-common nfs-kernel-server).each do |f|
  template "/etc/default/#{f}" do
    mode 00644
    notifies :restart, 'service[nfs-kernel-server]'
  end
end

execute 'exportfs' do
  command '/usr/sbin/exportfs -rv'
  action :nothing
end

template '/etc/exports' do
  variables(
    exports: node['mconigliaro_nfs_server']['exports']
  )
  mode 00644
  notifies :run, 'execute[exportfs]', :immediately
end
