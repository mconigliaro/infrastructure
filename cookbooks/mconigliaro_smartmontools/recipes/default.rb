#
# Cookbook Name:: mconigliaro_smartmontools
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'smartmontools'

service 'smartmontools' do
  action [:start, :enable]
end

template '/etc/default/smartmontools' do
  variables(
    start_smartd: node['mconigliaro_smartmontools']['enable']
  )
  mode 00644
  notifies :restart, 'service[smartmontools]'
end

mconigliaro_monit_service 'smartmontools'
