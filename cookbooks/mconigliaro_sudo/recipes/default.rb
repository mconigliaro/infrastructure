#
# Cookbook Name:: mconigliaro_sudo
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
package 'sudo'

template '/etc/sudoers' do
  mode 00440
end
