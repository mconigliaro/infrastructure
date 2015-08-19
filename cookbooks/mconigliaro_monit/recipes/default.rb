#
# Cookbook Name:: mconigliaro_monit
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
package 'monit'

service 'monit' do
  action [:start, :enable]
end

template '/etc/monit/monitrc' do
  mode 00600
  notifies :restart, 'service[monit]'
end

%w(cron rootfs).each do |obj|
  mconigliaro_monit_service obj
end
