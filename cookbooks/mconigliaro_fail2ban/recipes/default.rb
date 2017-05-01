#
# Cookbook Name:: mconigliaro_fail2ban
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
package 'fail2ban'

template '/etc/fail2ban/jail.local' do
  variables(
    dovecot_enabled: node['recipes'].include?('mconigliaro_dovecot::imap'),
    postfix_enabled: node['recipes'].include?('mconigliaro_postfix::amavis')
  )
  mode '0644'
  notifies :restart, 'service[fail2ban]'
end

service 'fail2ban' do
  action [:start, :enable]
end
