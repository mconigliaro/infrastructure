#
# Cookbook Name:: mconigliaro_postfix
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'postfix'

service 'postfix' do
  action [:start, :enable]
end

file '/etc/mailname' do
  content node['mconigliaro_postfix']['mailname'] + "\n"
  mode 00644
  notifies :restart, 'service[postfix]'
end

configure_smtpd_sasl = node['recipes'].include?('mconigliaro_dovecot::auth')
configure_amavis = node['recipes'].include?('mconigliaro_postfix::amavis')
configure_postgrey = node['recipes'].include?('mconigliaro_postfix::postgrey')
configure_dovecot_imap = node['recipes'].include?('mconigliaro_dovecot::imap')

template '/etc/postfix/master.cf' do
  variables(
    configure_smtpd_sasl: configure_smtpd_sasl,
    configure_amavis: configure_amavis
  )
  mode 00644
  notifies :restart, 'service[postfix]'
end

template '/etc/postfix/main.cf' do
  variables(
    inet_interfaces: node['mconigliaro_postfix']['inet_interfaces'].join(', '),
    myhostname: node['mconigliaro_postfix']['myhostname'],
    virtual_alias_domains: node['mconigliaro_postfix']['virtual_alias_domains'].join(' '),
    relayhost: node['mconigliaro_postfix']['relayhost'],
    configure_smtpd_sasl: configure_smtpd_sasl,
    configure_amavis: configure_amavis,
    configure_postgrey: configure_postgrey,
    configure_dovecot_imap: configure_dovecot_imap
  )
  mode 00644
  notifies :restart, 'service[postfix]'
end

node['mconigliaro_postfix']['maps'].each do |name, values|
  file "/etc/postfix/#{name}" do
    content values.join("\n")
    mode 00644
  end

  execute "/usr/sbin/postmap /etc/postfix/#{name}" do
    only_if { !File.exist?("/etc/postfix/#{name}.db") || File.mtime("/etc/postfix/#{name}.db").to_i < File.mtime("/etc/postfix/#{name}").to_i }
  end
end

template '/etc/aliases' do
  variables(
    configure_amavis: configure_amavis,
    aliases: node['mconigliaro_postfix']['aliases'].join("\n")
  )
  mode 00644
end

execute '/usr/bin/newaliases' do
  only_if { !File.exist?('/etc/aliases.db') || File.mtime('/etc/aliases.db').to_i < File.mtime('/etc/aliases').to_i }
end

mconigliaro_monit_service 'postfix' do
  variables(
    configure_smtpd_sasl: configure_smtpd_sasl,
    configure_amavis: configure_amavis
  )
end
