#
# Cookbook Name:: mconigliaro_sysstat
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
package 'sysstat'

service 'sysstat' do
  action [:start, :enable]
end

template '/etc/default/sysstat' do
  mode '0644'
  notifies :restart, 'service[sysstat]'
end
