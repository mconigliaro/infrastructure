#
# Cookbook Name:: mconigliaro_dovecot
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'dovecot-common'

service 'dovecot' do
  action [:start, :enable]
end

template '/etc/dovecot/conf.d/99-ssl.conf' do
  mode '0644'
  notifies :restart, 'service[dovecot]'
end

mconigliaro_monit_service 'dovecot' do
  variables(
    configure_dovecot_imap: node['recipes'].include?('mconigliaro_dovecot::imap')
  )
end
