#
# Cookbook Name:: nfs
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
node[:nfs][:mounts].each do |d,mp|
  directory mp do
    recursive true
    mode "0777"
  end

  mount mp do
    device d
    fstype "none"
    options "bind"
    action [:mount, :enable]
  end
end

package "nfs-kernel-server"

service "nfs-kernel-server" do
  action :enable
end

%w{
  nfs-common
  nfs-kernel-server
}.each do |f|
  template "/etc/default/#{f}" do
    source "#{f}.default.erb"
    mode "0644"
    notifies :restart, resources(:service => "nfs-kernel-server")
  end
end

execute "exportfs" do
  command "/usr/sbin/exportfs -rv"
  action :nothing
end

template "/etc/exports" do
  source "exports.erb"
  mode "0644"
  notifies :run, "execute[exportfs]", :immediately
end
