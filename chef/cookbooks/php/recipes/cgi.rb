#
# Cookbook Name:: php
# Recipe:: cgi
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
[
  'php5-cgi',
  'php5-fpm'
].each { |p| package p }

service 'php5-fpm' do
  action :enable
end

template '/etc/monit/conf.d/php5-fpm.monit' do
  source 'php5-fpm.monit.erb'
  mode '0644'
  notifies :restart, resources(:service => 'monit')
end
