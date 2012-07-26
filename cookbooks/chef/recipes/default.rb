#
# Cookbook Name:: chef
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
execute "/usr/bin/curl -s http://apt.opscode.com/packages@opscode.com.gpg.key | /usr/bin/apt-key add -" do
  not_if "/usr/bin/apt-key list | grep 'opscode.com'"
end

template "/etc/apt/sources.list.d/opscode.list" do
  source "opscode.list.erb"
  mode "0644"
  notifies :run, "execute[aptitude_update]", :immediately
end
