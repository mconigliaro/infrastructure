#
# Cookbook Name:: mconigliaro_hosts
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
template '/etc/hosts' do
  variables(
    domain: node['mconigliaro_hosts']['domain']
  )
  mode 00644
  notifies :reload, 'ohai[reload]'
end

ohai 'reload' do
  action :nothing
end
