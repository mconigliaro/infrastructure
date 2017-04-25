#
# Cookbook Name:: mconigliaro_cups
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'cups'

# FIXME: Why is this here? It conflicts with the Upstart script.
%w(cups cups-browsed).each do |obj|
  file "/etc/init.d/#{obj}" do
    action :delete
  end
end

%w(cups cups-browsed).each do |obj|
  service obj do
    action [:start, :enable]
  end
end

template '/etc/cups/cupsd.conf' do
  mode '0644'
  notifies :restart, 'service[cups]'
end

mconigliaro_monit_service 'cups'
