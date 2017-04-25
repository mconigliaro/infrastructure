#
# Cookbook Name:: mconigliaro_attic
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
%w(sshfs python3-dev libacl1-dev libssl-dev python-virtualenv).each do |obj|
  package obj
end

execute "virtualenv -p python3 #{node['mconigliaro_attic']['virtualenv_path']}" do
  creates node['mconigliaro_attic']['virtualenv_path']
end

execute './bin/pip3 install attic' do
  cwd node['mconigliaro_attic']['virtualenv_path']
  creates "#{node['mconigliaro_attic']['virtualenv_path']}/bin/attic"
end

template '/usr/local/bin/attic' do
  variables(
    virtualenv_path: node['mconigliaro_attic']['virtualenv_path']
  )
  mode '0755'
end

template '/usr/local/bin/attic_backup' do
  mode '0755'
end
