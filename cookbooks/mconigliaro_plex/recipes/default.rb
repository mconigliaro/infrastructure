#
# Cookbook Name:: mconigliaro_plex
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
remote_file "#{Chef::Config[:file_cache_path]}/plexmediaserver_#{node['mconigliaro_plex']['version']}_amd64.deb" do
  source "http://downloads.plex.tv/plex-media-server/#{node['mconigliaro_plex']['version']}/plexmediaserver_#{node['mconigliaro_plex']['version']}_amd64.deb"
  checksum node['mconigliaro_plex']['checksum']
  not_if { ::File.directory?('/usr/lib/plexmediaserver') }
end

dpkg_package 'plexmediaserver' do
  source "#{Chef::Config[:file_cache_path]}/plexmediaserver_#{node['mconigliaro_plex']['version']}_amd64.deb"
  not_if { ::File.directory?('/usr/lib/plexmediaserver') }
end

service 'plexmediaserver' do
  action [:start, :enable]
end
