#
# Cookbook Name:: mconigliaro_dovecot
# Recipe:: auth
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_postfix'
include_recipe 'mconigliaro_dovecot'

template '/etc/dovecot/conf.d/99-auth.conf' do
  mode '0644'
  notifies :restart, 'service[dovecot]'
end
