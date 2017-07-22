#
# Cookbook Name:: mconigliaro_plexmediaserver
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_monit'

# The plexmediaserver package will complain if plexmediaserver.list already
# exists, so we write our own version with a different name.
apt_repository 'plexmediaserver.enabled' do
  uri 'http://downloads.plex.tv/repo/deb/'
  distribution 'public'
  components %w(main)
  key 'https://downloads.plex.tv/plex-keys/PlexSign.key'
end

package 'plexmediaserver'

service 'plexmediaserver' do
  action [:start, :enable]
end

mconigliaro_monit_service 'plexmediaserver'
