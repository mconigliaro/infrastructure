#
# Cookbook Name:: mconigliaro_openssh
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'openssh-server'

service 'ssh' do
  action [:start, :enable]
end

template '/etc/ssh/sshd_config' do
  mode '0644'
  notifies :restart, 'service[ssh]'
end

mconigliaro_monit_service 'openssh'
