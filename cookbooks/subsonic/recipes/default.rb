#
# Cookbook Name:: subsonic
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
include_recipe "java"

file_name = "/var/cache/apt/archives/#{node["subsonic"]["download_url"].split("/").last}"

execute "subsonic_install" do
  command "dpkg -i --force-confnew #{file_name}"
  action :nothing
end

remote_file file_name do
  source node["subsonic"]["download_url"]
  mode "0644"
  notifies :run, "execute[subsonic_install]", :immediately
  not_if "test `dpkg-query --showformat '${Version}' --show subsonic` = '#{node["subsonic"]["version"]}'"
end

service "subsonic" do
  action :enable
end

template "/etc/default/subsonic" do
  source "subsonic.default.erb"
  mode "0644"
  notifies :restart, "service[subsonic]"
end

template "/etc/monit/conf.d/subsonic.monit" do
  source "subsonic.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
