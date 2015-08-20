#
# Cookbook Name:: mconigliaro_netatalk
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_avahi'
include_recipe 'mconigliaro_monit'

package 'netatalk'

service 'netatalk' do
  # FIXME: We can't use :start here because the init script dies if the service
  # is already running.
  action :enable
end

template '/etc/netatalk/AppleVolumes.default' do
  mode 00644
  notifies :restart, 'service[netatalk]'
end

mconigliaro_avahi_service 'afpd' do
  notifies :restart, 'service[netatalk]'
end

mconigliaro_monit_service 'netatalk'

file '/etc/skel/.com.apple.timemachine.supported' do
  mode 00644
end
