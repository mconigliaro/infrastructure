#
# Cookbook Name:: mconigliaro_vsftpd
# Recipe:: default
#
# Copyright:: 2017, Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'vsftpd'

template '/etc/vsftpd.conf' do
  mode '0644'
  notifies :restart, 'service[vsftpd]'
end

service 'vsftpd' do
  action %w[start enable]
end

mconigliaro_monit_service 'vsftpd'
