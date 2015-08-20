#
# Cookbook Name:: mconigliaro_avahi
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

%w(
  avahi-daemon
  avahi-utils
).each { |p| package p }

service 'avahi-daemon' do
  action [:start, :enable]
end

mconigliaro_monit_service 'avahi'
