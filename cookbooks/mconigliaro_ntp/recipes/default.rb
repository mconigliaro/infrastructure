#
# Cookbook Name:: mconigliaro_ntp
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'ntp'

service 'ntp' do
  action [:start, :enable]
end

mconigliaro_monit_service 'ntp'
