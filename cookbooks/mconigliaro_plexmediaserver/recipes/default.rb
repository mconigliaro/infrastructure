#
# Cookbook Name:: mconigliaro_plexmediaserver
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

remote_file "#{Chef::Config[:file_cache_path]}/plexmediaserver_#{node['mconigliaro_plexmediaserver']['version']}_amd64.deb" do
  source "http://downloads.plex.tv/plex-media-server/#{node['mconigliaro_plexmediaserver']['version']}/plexmediaserver_#{node['mconigliaro_plexmediaserver']['version']}_amd64.deb"
  checksum node['mconigliaro_plexmediaserver']['checksum']
  not_if { ::File.directory?('/usr/lib/plexmediaserver') }
end

dpkg_package 'plexmediaserver' do
  source "#{Chef::Config[:file_cache_path]}/plexmediaserver_#{node['mconigliaro_plexmediaserver']['version']}_amd64.deb"
  not_if { ::File.directory?('/usr/lib/plexmediaserver') }
end

service 'plexmediaserver' do
  action [:start, :enable]
end

mconigliaro_monit_service 'plexmediaserver'
