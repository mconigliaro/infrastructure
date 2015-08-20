#
# Cookbook Name:: mconigliaro_apt
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
template '/etc/apt/apt.conf.d/70debconf' do
  mode 00644
end

execute 'aptitude_update' do
  command 'aptitude update'
  action :nothing
end

template '/etc/apt/sources.list' do
  mode 00644
  notifies :run, 'execute[aptitude_update]', :immediately
end
