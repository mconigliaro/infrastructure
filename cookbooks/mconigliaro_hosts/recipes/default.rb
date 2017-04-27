#
# Cookbook Name:: mconigliaro_hosts
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
template '/etc/hosts' do
  variables(
    domain: node['mconigliaro_hosts']['domain']
  )
  mode '0644'
  notifies :reload, 'ohai[reload]', :immediately
end

ohai 'reload' do
  action :nothing
end
