#
# Cookbook Name:: mconigliaro_rsyslog
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'rsyslog'

service 'rsyslog' do
  action [:start, :enable]
end

mconigliaro_monit_service 'rsyslog'
