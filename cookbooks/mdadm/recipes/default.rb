#
# Cookbook Name:: mdadm
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package "mdadm"

service "mdadm" do
  action :enable
end

template "/etc/mdadm/mdadm.conf" do
  source "mdadm.conf.erb"
  mode "0644"
  notifies :restart, "service[mdadm]"
end

node["mdadm"]["arrays"].each do |array,opts|
  mdadm array do
    opts.each { |n,v| send(n, v)  }
    notifies :create, "template[/etc/mdadm/mdadm.conf]"
  end
end

node["mdadm"]["mounts"].each do |mount_point,opts|
  directory mount_point

  mount mount_point do
    opts.each { |n,v| send(n, v)  }
  end
end

template "/etc/monit/conf.d/mdadm.monit" do
  source "mdadm.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
