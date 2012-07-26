#
# Cookbook Name:: roundcube
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
include_recipe "apache::php", "mysql"

%w{
  roundcube-mysql
  roundcube
}.each { |p| package p }

template "/etc/roundcube/apache.conf" do
  source "apache.conf.erb"
  mode "0644"
  notifies :restart, "service[apache2]"
end
