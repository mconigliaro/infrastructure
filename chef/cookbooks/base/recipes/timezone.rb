#
# Cookbook Name:: base
# Recipe:: timezone
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
execute "dpkg-reconfigure_tzdata" do
  command "dpkg-reconfigure -f noninteractive tzdata"
  action :nothing
  notifies :restart, resources(:service => "rsyslog"), :immediately
end

template "timezone" do
  source "timezone.erb"
  path "/etc/timezone"
  mode "0644"
  notifies :run, resources(:execute => "dpkg-reconfigure_tzdata"), :immediately
end