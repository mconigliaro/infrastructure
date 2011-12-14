#
# Cookbook Name:: fail2ban
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "fail2ban" do
  package_name "fail2ban"
end

service "fail2ban" do
  service_name "fail2ban"
  action :enable
end

template "fail2ban.conf" do
  source "fail2ban.conf.erb"
  path "/etc/fail2ban/fail2ban.conf"
  mode "0644"
  notifies :restart, resources(:service => "fail2ban")
end

template "fail2ban.monit" do
  source "fail2ban.monit.erb"
  path "/etc/monit/conf.d/fail2ban.monit"
  mode "0644"
  notifies :restart, resources(:service => "monit")
end
