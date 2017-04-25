#
# Cookbook Name:: mconigliaro_unattended_upgrades
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
package 'unattended-upgrades'

%w(20auto-upgrades 50unattended-upgrades).each do |obj|
  template "/etc/apt/apt.conf.d/#{obj}" do
    mode '0644'
  end
end
