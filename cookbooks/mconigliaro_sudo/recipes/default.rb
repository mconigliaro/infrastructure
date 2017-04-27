#
# Cookbook Name:: mconigliaro_sudo
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
package 'sudo'

template '/etc/sudoers' do
  mode '0440'
end
