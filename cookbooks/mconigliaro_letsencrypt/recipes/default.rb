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

execute "certbot certonly --non-interactive --agree-tos --email #{node['mconigliaro_letsencrypt']['certbot']['email']} --standalone --domains #{node['mconigliaro_letsencrypt']['certbot']['domains'].join(',')}" do
  not_if { node['mconigliaro_letsencrypt']['certbot']['email'].nil? || node['mconigliaro_letsencrypt']['certbot']['domains'].empty? }
  creates '/etc/letsencrypt/live'
end

template '/etc/cron.daily/certbot-renew' do
  mode '0755'
end
