#
# Cookbook Name:: mconigliaro_letsencrypt
# Recipe:: default
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
apt_repository 'certbot' do
  uri 'ppa:certbot/certbot'
  distribution node['lsb']['codename']
  components %w(main)
  key '75BCA694'
  keyserver 'keyserver.ubuntu.com'
end

package 'certbot'
