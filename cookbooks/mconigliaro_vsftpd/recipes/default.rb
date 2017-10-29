#
# Cookbook Name:: mconigliaro_vsftpd
# Recipe:: default
#
# Copyright:: 2017, Mike Conigliaro, All Rights Reserved.
package 'vsftpd'

template '/etc/vsftpd.conf' do
  mode '0644'
  notifies :restart, 'service[vsftpd]'
end

service 'vsftpd' do
  action %w[start enable]
end
