#
# Cookbook Name:: mconigliaro_postfix
# Recipe:: postgrey
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
package 'postgrey'

template '/etc/default/postgrey' do
  variables(
    delay: node['mconigliaro_postfix']['postgrey']['delay']
  )
  mode '0644'
  notifies :restart, 'service[postgrey]'
end

template '/etc/postgrey/whitelist_clients' do
  mode '0644'
  notifies :restart, 'service[postgrey]'
end

service 'postgrey' do
  action [:start, :enable]
end

mconigliaro_monit_service 'postgrey'
