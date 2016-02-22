#
# Cookbook Name:: mconigliaro_ddclient
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'ddclient'

service 'ddclient' do
  action [:start, :enable]
end

template '/etc/ddclient.conf' do
  variables(
    login: node['mconigliaro_ddclient']['login'],
    password: node['mconigliaro_ddclient']['password'],
    hosts: node['mconigliaro_ddclient']['hosts'].join(',')
  )
  mode 00600
  sensitive true
  notifies :restart, 'service[ddclient]'
end

mconigliaro_monit_service 'ddclient'
