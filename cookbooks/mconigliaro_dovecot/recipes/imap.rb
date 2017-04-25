#
# Cookbook Name:: mconigliaro_dovecot
# Recipe:: imap
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_dovecot'

%w(dovecot-imapd dovecot-sieve).each do |obj|
  package obj
end

template '/etc/dovecot/conf.d/99-imap.conf' do
  mode '0644'
  notifies :restart, 'service[dovecot]'
end

cookbook_file '/etc/skel/.dovecot.sieve' do
  mode '0644'
end
