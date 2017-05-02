#
# Cookbook Name:: mconigliaro_unattended_upgrades
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
package 'unattended-upgrades'

template '/etc/apt/apt.conf.d/50unattended-upgrades' do
  mode '0644'
end
