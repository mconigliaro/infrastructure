#
# Cookbook Name:: apache
# Recipe:: php
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
include_recipe "apache"

%w{
  libapache2-mod-php5
  php5-cli
  php5-mysql
}.each { |p| package p }

execute "/usr/sbin/a2enmod php5" do
  not_if { File.symlink?("/etc/apache2/mods-enabled/php5.load") }
  notifies :restart, "service[apache2]"
end
