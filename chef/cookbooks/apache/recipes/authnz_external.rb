#
# Cookbook Name:: apache
# Recipe:: authnz_external
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
include_recipe "apache"

package "libapache2-mod-authnz-external"

execute "/usr/sbin/a2enmod authnz_external" do
  not_if { File.symlink?("/etc/apache2/mods-enabled/authnz_external.load") }
  notifies :restart, "service[apache2]"
end

package "pwauth"

template "/etc/apache2/conf.d/pwauth" do
  source "pwauth.erb"
  mode "0644"
  notifies :restart, "service[apache2]"
end
