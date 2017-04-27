#
# Cookbook Name:: mconigliaro_ubuntu
# Recipe:: swap
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
execute 'fallocate -l 1G /swapfile' do
  creates '/swapfile'
end

file '/swapfile' do
  mode '0600'
end

execute 'mkswap /swapfile' do
  not_if 'file /swapfile | grep "swap file"'
end

execute 'swapon /swapfile' do
  not_if 'swapon -s | grep "/swapfile"'
end

mount 'swapfile' do
  device '/swapfile'
  mount_point 'none'
  fstype 'swap'
  options 'sw'
  pass 0
  action :enable
end
