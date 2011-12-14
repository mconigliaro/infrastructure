#
# Cookbook Name:: php
# Recipe:: cgi
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
['php5-cgi', 'php5-fpm'].each do |p|
  package p do
    package_name p
  end
end

service 'php5-fpm' do
  service_name 'php5-fpm'
  action :enable
end

template 'php5-fpm.monit' do
  source 'php5-fpm.monit.erb'
  path '/etc/monit/conf.d/php5-fpm.monit'
  mode '0644'
  notifies :restart, resources(:service => 'monit')
end
