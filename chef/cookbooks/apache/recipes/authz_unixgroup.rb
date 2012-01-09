#
# Cookbook Name:: apache
# Recipe:: authz_unixgroup
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
include_recipe "apache"

package "libapache2-mod-authz-unixgroup"

execute "/usr/sbin/a2enmod authz_unixgroup" do
  not_if { File.symlink?("/etc/apache2/mods-enabled/authz_unixgroup.load") }
  notifies :restart, resources(:service => "apache2")
end