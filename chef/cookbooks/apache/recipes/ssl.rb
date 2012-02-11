#
# Cookbook Name:: apache
# Recipe:: ssl
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
include_recipe "apache"

execute "/usr/sbin/a2enmod ssl" do
  not_if { File.symlink?("/etc/apache2/mods-enabled/ssl.load") }
  notifies :restart, "service[apache2]"
end

execute "/usr/sbin/a2ensite default-ssl" do
  not_if { File.symlink?("/etc/apache2/sites-enabled/default-ssl") }
  notifies :restart, "service[apache2]"
end
