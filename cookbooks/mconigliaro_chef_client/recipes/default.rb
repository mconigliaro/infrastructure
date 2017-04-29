#
# Cookbook Name:: mconigliaro_chef_client
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
apt_repository 'chef-stable' do
  uri 'https://packages.chef.io/stable-apt'
  distribution node['lsb']['codename']
  components %w(main)
  key 'https://downloads.chef.io/packages-chef-io-public.key'
end

package 'chef'
