#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package 'nginx'

service 'nginx' do
  action :enable
end

template '/etc/monit/conf.d/nginx.monit' do
  source 'nginx.monit.erb'
  mode '0644'
  notifies :restart, resources(:service => 'monit')
end
