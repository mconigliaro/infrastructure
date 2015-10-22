#
# Cookbook Name:: mconigliaro_openssh
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'openssh-server'

service 'ssh' do
  action [:start, :enable]
end

template '/etc/ssh/sshd_config' do
  mode 00644
  notifies :restart, 'service[ssh]'
end

mconigliaro_monit_service 'openssh'
