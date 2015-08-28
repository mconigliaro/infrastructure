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
  variables(
    mail_format_from: node['mconigliaro_monit']['mail_format']['from']
  )
  mode 00600
  notifies :restart, 'service[monit]'
end

%w(cron rootfs).each do |obj|
  mconigliaro_monit_service obj
end

template '/etc/cron.daily/monit-monitor-all' do
  mode 00755
end
