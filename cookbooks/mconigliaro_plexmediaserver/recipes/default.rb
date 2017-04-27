#
# Cookbook Name:: mconigliaro_plexmediaserver
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

# The plexmediaserver package will complain if plexmediaserver.list already
# exists, so we write a temporary version to make the initial install succeed,
# then we remove it once the install has completed.
apt_repository 'plexmediaserver.tmp' do
  uri 'http://downloads.plex.tv/repo/deb/'
  distribution 'public'
  components %w(main)
  key 'https://downloads.plex.tv/plex-keys/PlexSign.key'
  action :nothing
end

package 'plexmediaserver' do
  notifies :add, 'apt_repository[plexmediaserver.tmp]', :before
  notifies :remove, 'apt_repository[plexmediaserver.tmp]'
end

service 'plexmediaserver' do
  action [:start, :enable]
end

mconigliaro_monit_service 'plexmediaserver'
