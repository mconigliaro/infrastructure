#
# Cookbook Name:: mconigliaro_mail
# Recipe:: _postfix
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

package 'postfix'

service 'postfix' do
  action [:start, :enable]
end

file '/etc/mailname' do
  content node['mconigliaro_mail']['mailname'] + "\n"
  mode 00644
  notifies :restart, 'service[postfix]'
end

template '/etc/postfix/master.cf' do
  variables(
    configure_server: run_context.loaded_recipes.include?('mconigliaro_mail::server')
  )
  mode 00644
  notifies :restart, 'service[postfix]'
end

template '/etc/postfix/main.cf' do
  variables(
    inet_interfaces: node['mconigliaro_mail']['postfix']['inet_interfaces'].join(', '),
    myhostname: node['fqdn'],
    virtual_alias_domains: node['mconigliaro_mail']['postfix']['virtual_alias_domains'].join(' '),
    relayhost: node['mconigliaro_mail']['postfix']['relayhost'],
    configure_server: run_context.loaded_recipes.include?('mconigliaro_mail::server')
  )
  mode 00644
  notifies :restart, 'service[postfix]'
end

node['mconigliaro_mail']['postfix']['maps'].each do |name, values|
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
    aliases: node['mconigliaro_mail']['postfix']['aliases'].join("\n")
  )
  mode 00644
end

execute '/usr/bin/newaliases' do
  only_if { !File.exist?('/etc/aliases.db') || File.mtime('/etc/aliases.db').to_i < File.mtime('/etc/aliases').to_i }
end

mconigliaro_monit_service 'postfix' do
  variables(
    configure_server: run_context.loaded_recipes.include?('mconigliaro_mail::server')
  )
end
