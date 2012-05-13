#
# Cookbook Name:: bind
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "bind9"

service "bind9" do
  action :enable
end

%w{
  named.conf.options
  named.conf.local
}.each do |f|
  template "/etc/bind/#{f}" do
    source "#{f}.erb"
    mode "0644"
    group "bind"
    notifies :restart, "service[bind9]"
  end
end

node[:bind][:zones].each do |zone,records|
  template "/etc/bind/db.#{zone}" do
    source "db.zone.erb"
    variables({
      :zone    => zone,
      :records => records
    })
    mode "0644"
    group "bind"
    notifies :restart, "service[bind9]"
  end
end

template "/etc/monit/conf.d/bind.monit" do
  source "bind.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
