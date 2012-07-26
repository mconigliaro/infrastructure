#
# Cookbook Name:: fail2ban
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "fail2ban"

service "fail2ban" do
  action :enable
end

template "/etc/fail2ban/fail2ban.conf" do
  source "fail2ban.conf.erb"
  mode "0644"
  notifies :restart, "service[fail2ban]"
end

template "/etc/monit/conf.d/fail2ban.monit" do
  source "fail2ban.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
