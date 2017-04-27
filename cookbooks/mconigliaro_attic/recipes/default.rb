#
# Cookbook Name:: mconigliaro_attic
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
package 'attic'

template '/usr/local/bin/attic_backup' do
  mode '0755'
end
