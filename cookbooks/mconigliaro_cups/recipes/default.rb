#
# Cookbook Name:: mconigliaro_cups
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'cups'

# FIXME: Why is this here? It conflicts with the Upstart script.
file '/etc/init.d/cups' do
  action :delete
end

service 'cups' do
  action [:start, :enable]
end

template '/etc/cups/cupsd.conf' do
  mode 00644
  notifies :restart, 'service[cups]'
end

mconigliaro_monit_service 'cups'
