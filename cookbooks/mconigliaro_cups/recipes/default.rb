#
# Cookbook Name:: mconigliaro_cups
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'cups'

service 'cups' do
  action [:start, :enable]
end

# FIXME: Do we need this?
# template '/etc/cups/cupsd.conf' do
#   mode 00644
#   notifies :restart, 'service[cups]'
# end

mconigliaro_monit_service 'cups'
