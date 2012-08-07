#
# Cookbook Name:: netatalk
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "netatalk"

service "netatalk" do
  action :enable
end

template "/etc/netatalk/AppleVolumes.default" do
  source "AppleVolumes.default.erb"
  mode "0644"
  notifies :restart, "service[netatalk]"
end

template "/etc/avahi/services/afpd.service" do
  source "afpd.service.erb"
  mode "0644"
  notifies :restart, "service[avahi-daemon]"
  notifies :restart, "service[netatalk]"
end

template "/etc/monit/conf.d/netatalk.monit" do
  source "netatalk.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end

file "/etc/skel/.com.apple.timemachine.supported" do
  content ""
  mode "0644"
end
