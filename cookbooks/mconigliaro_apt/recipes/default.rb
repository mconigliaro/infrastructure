#
# Cookbook Name:: mconigliaro_apt
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
template '/etc/apt/apt.conf.d/70debconf' do
  mode '0644'
end

apt_update 'periodic' do
  action :periodic
end

template '/etc/apt/sources.list' do
  mode '0644'
  notifies :periodic, 'apt_update[periodic]', :immediately
end
