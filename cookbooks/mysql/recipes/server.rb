#
# Cookbook Name:: mysql
# Recipe:: server
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "mysql-server"

service "mysql" do
  action :enable
end

template "/etc/mysql/conf.d/monit.cnf" do
  source "monit.cnf.erb"
  mode "0644"
  notifies :restart, "service[mysql]"
end

template "/etc/monit/conf.d/mysql.monit" do
  source "mysql.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
